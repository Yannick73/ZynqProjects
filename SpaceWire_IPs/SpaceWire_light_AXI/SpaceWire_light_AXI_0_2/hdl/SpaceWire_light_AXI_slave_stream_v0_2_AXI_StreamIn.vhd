library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn is
	generic (
		-- Users to add parameters here
		ESCAPE_CHAR : std_logic_vector (7 downto 0) := x"7D";

		-- User parameters ends
		-- Do not modify the parameters beyond this line

		-- AXI4Stream sink: Data Width
		C_S_AXIS_TDATA_WIDTH	: integer	:= 8
	);
	port (
		-- Users to add ports here
		
        SPW_TXRDY : in std_logic;
        SPW_TXFIFO : out std_logic_vector (7 downto 0);
        SPW_TXFLAG : out std_logic;
        SPW_TXWRITE : out std_logic;
        SPW_CLK : in std_logic;
		-- User ports ends
		-- Do not modify the ports beyond this line

		-- AXI4Stream sink: Clock
		S_AXIS_ACLK	: in std_logic;
		-- AXI4Stream sink: Reset
		S_AXIS_ARESETN	: in std_logic;
		-- Ready to accept data in
		S_AXIS_TREADY	: out std_logic;
		-- Data in
		S_AXIS_TDATA	: in std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
		-- Byte qualifier (should only be relevant for interfaces, bigger then 8 bit)
		S_AXIS_TSTRB	: in std_logic_vector((C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
		-- Indicates boundary of last packet
		S_AXIS_TLAST	: in std_logic;
		-- Data is in valid
		S_AXIS_TVALID	: in std_logic
	);
	
   --! Convert boolean to std_logic type.
   type bool_to_logic_type is array(boolean) of std_ulogic;
   --! use the bool_to_logic_type to map boolean to std_ulogic.
   constant BOOL_TO_LOGIC : bool_to_logic_type := (false => '0', true => '1');
   
end SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn;

architecture arch_imp of SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn is
    signal char_fifo : std_logic_vector (7 downto 0) := x"00";   -- data to be transmitted next clock cycle
    signal txflag_fifo : std_logic := '0';
    signal fifo_full : std_logic := '0';    -- indicate, whether a byte is to be transmitted next cycle of the spw clk
    shared variable fifo_full_clear : boolean := false;
begin

    S_AXIS_TREADY <= not fifo_full and SPW_TXRDY;
    
	process(S_AXIS_ACLK)
    variable previous_escape : boolean := false;  -- save, if the previous character was an escape character
	begin
	  if (rising_edge (S_AXIS_ACLK)) then
	    if(S_AXIS_ARESETN = '0') then
	       -- synchronous reset
	       previous_escape := false;
	       char_fifo <= x"00";
	       txflag_fifo <= '0';
	       fifo_full <= '0';
	       
	    else
	       if fifo_full_clear then
	           -- clear the remaining fifo_full flag, if fifo was written
	           fifo_full <= '0';
	       end if;
	       
	       if (S_AXIS_TVALID = '1') then
	       -- current data is to be written
	    
               if previous_escape then
                   -- previous escape means either another normal escape, or a control char
                   -- remove the previous escape flag and set the fifo_full flag
                   previous_escape := false;
                   fifo_full <= '1';
                   if (S_AXIS_TDATA = ESCAPE_CHAR) then
                       -- two escapes in succession -> escape char is transmitted
                       txflag_fifo <= '0';
                       char_fifo <= S_AXIS_TDATA;
                   else
                       -- control char
                       txflag_fifo <= '1';
                       -- mask the 2 control bits
                       char_fifo <= S_AXIS_TDATA and "00000011";
                   end if;
               else 
               
                   -- normal case (previous char was no escape)
                   if (S_AXIS_TDATA = ESCAPE_CHAR) then
                       -- set escape and do nothing in this cycle
                       previous_escape := true;
                   else
                       txflag_fifo <= '0';
                       char_fifo <= S_AXIS_TDATA;
                       fifo_full <= '1';
                   end if;	       
               end if;
	       end if;
	       
	       
	    end if;
	  end if;
	end process;
	  
    process(SPW_CLK)
    variable previous_escape : boolean := false;  -- save, if the previous character was an escape character
	begin
	   if (rising_edge(SPW_CLK) and S_AXIS_ARESETN = '0') then
	       fifo_full_clear := false;	   
	   end if;
	  
	   if (falling_edge(SPW_CLK)) then
	       if (fifo_full = '1') then
               -- write the data on the falling edge, so it may be ready on the next rising edge
               fifo_full_clear := true;
               SPW_TXFIFO <= char_fifo;
               SPW_TXFLAG <= txflag_fifo;
               SPW_TXWRITE <= '1';
	       else
	           -- if no data is to be written, then remove the the write flag
	           SPW_TXWRITE <= '0';
	           fifo_full_clear := false;
	       end if;
	   end if;
	end process; 

end arch_imp;

--architecture arch_imp of SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn is
--	-- function called clogb2 that returns an integer which has the 
--	-- value of the ceiling of the log base 2.
--	function clogb2 (bit_depth : integer) return integer is 
--	variable depth  : integer := bit_depth;
--	  begin
--	    if (depth = 0) then
--	      return(0);
--	    else
--	      for clogb2 in 1 to bit_depth loop  -- Works for up to 32 bit integers
--	        if(depth <= 1) then 
--	          return(clogb2);      
--	        else
--	          depth := depth / 2;
--	        end if;
--	      end loop;
--	    end if;
--	end;    

--	-- Total number of input data.
--	constant NUMBER_OF_INPUT_WORDS  : integer := 8;
--	-- bit_num gives the minimum number of bits needed to address 'NUMBER_OF_INPUT_WORDS' size of FIFO.
--	constant bit_num  : integer := clogb2(NUMBER_OF_INPUT_WORDS-1);
--	-- Define the states of state machine
--	-- The control state machine oversees the writing of input streaming data to the FIFO,
--	-- and outputs the streaming data from the FIFO
--	type state is ( IDLE,        -- This is the initial/idle state 
--	                WRITE_FIFO); -- In this state FIFO is written with the
--	                             -- input stream data S_AXIS_TDATA 
--	signal axis_tready	: std_logic;
--	-- State variable
--	signal  mst_exec_state : state;  
--	-- FIFO implementation signals
--	signal  byte_index : integer;    
--	-- FIFO write enable
--	signal fifo_wren : std_logic;
--	-- FIFO full flag
--	signal fifo_full_flag : std_logic;
--	-- FIFO write pointer
--	signal write_pointer : integer range 0 to bit_num-1 ;
--	-- sink has accepted all the streaming data and stored in FIFO
--	signal writes_done : std_logic;

--	type BYTE_FIFO_TYPE is array (0 to (NUMBER_OF_INPUT_WORDS-1)) of std_logic_vector(((C_S_AXIS_TDATA_WIDTH/4)-1)downto 0);
--begin
--	-- I/O Connections assignments

--	S_AXIS_TREADY	<= axis_tready;
--	-- Control state machine implementation
--	process(S_AXIS_ACLK)
--	begin
--	  if (rising_edge (S_AXIS_ACLK)) then
--	    if(S_AXIS_ARESETN = '0') then
--	      -- Synchronous reset (active low)
--	      mst_exec_state      <= IDLE;
--	    else
--	      case (mst_exec_state) is
--	        when IDLE     => 
--	          -- The sink starts accepting tdata when 
--	          -- there tvalid is asserted to mark the
--	          -- presence of valid streaming data 
--	          if (S_AXIS_TVALID = '1')then
--	            mst_exec_state <= WRITE_FIFO;
--	          else
--	            mst_exec_state <= IDLE;
--	          end if;
	      
--	        when WRITE_FIFO => 
--	          -- When the sink has accepted all the streaming input data,
--	          -- the interface swiches functionality to a streaming master
--	          if (writes_done = '1') then
--	            mst_exec_state <= IDLE;
--	          else
--	            -- The sink accepts and stores tdata 
--	            -- into FIFO
--	            mst_exec_state <= WRITE_FIFO;
--	          end if;
	        
--	        when others    => 
--	          mst_exec_state <= IDLE;
	        
--	      end case;
--	    end if;  
--	  end if;
--	end process;
--	-- AXI Streaming Sink 
--	-- 
--	-- The example design sink is always ready to accept the S_AXIS_TDATA  until
--	-- the FIFO is not filled with NUMBER_OF_INPUT_WORDS number of input words.
--	axis_tready <= '1' when ((mst_exec_state = WRITE_FIFO) and (write_pointer <= NUMBER_OF_INPUT_WORDS-1)) else '0';

--	process(S_AXIS_ACLK)
--	begin
--	  if (rising_edge (S_AXIS_ACLK)) then
--	    if(S_AXIS_ARESETN = '0') then
--	      write_pointer <= 0;
--	      writes_done <= '0';
--	    else
--	      if (write_pointer <= NUMBER_OF_INPUT_WORDS-1) then
--	        if (fifo_wren = '1') then
--	          -- write pointer is incremented after every write to the FIFO
--	          -- when FIFO write signal is enabled.
--	          write_pointer <= write_pointer + 1;
--	          writes_done <= '0';
--	        end if;
--	        if ((write_pointer = NUMBER_OF_INPUT_WORDS-1) or S_AXIS_TLAST = '1') then
--	          -- reads_done is asserted when NUMBER_OF_INPUT_WORDS numbers of streaming data 
--	          -- has been written to the FIFO which is also marked by S_AXIS_TLAST(kept for optional usage).
--	          writes_done <= '1';
--	        end if;
--	      end  if;
--	    end if;
--	  end if;
--	end process;

--	-- FIFO write enable generation
--	fifo_wren <= S_AXIS_TVALID and axis_tready;

--	-- FIFO Implementation
--	 FIFO_GEN: for byte_index in 0 to (C_S_AXIS_TDATA_WIDTH/8-1) generate

--	 signal stream_data_fifo : BYTE_FIFO_TYPE;
--	 begin   
--	  -- Streaming input data is stored in FIFO
--	  process(S_AXIS_ACLK)
--	  begin
--	    if (rising_edge (S_AXIS_ACLK)) then
--	      if (fifo_wren = '1') then
--	        stream_data_fifo(write_pointer) <= S_AXIS_TDATA((byte_index*8+7) downto (byte_index*8));
--	      end if;  
--	    end  if;
--	  end process;

--	end generate FIFO_GEN;

--	-- Add user logic here

--	-- User logic ends

--end arch_imp;
