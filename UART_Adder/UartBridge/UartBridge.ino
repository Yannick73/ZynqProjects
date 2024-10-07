uint64_t led_timer;
bool led_state = LOW;
const uint64_t led_blink_time = 500;
const uint64_t led_quick_blink = 100;

void setup() {
  // begin with the USB serial and wait, until it is connected
  SerialUSB.begin(9600);
  Serial1.begin(9600);
  pinMode(LED_BUILTIN, OUTPUT);
  led_timer = millis();
  while(!SerialUSB) {
    if(millis() - led_timer > led_quick_blink) {
      led_timer = millis();
      led_state = !led_state;
      digitalWrite(LED_BUILTIN, led_state);
    }
  }
}

void loop() {
  if(SerialUSB.available() > 0) {
    Serial1.write(SerialUSB.read());
  }
  if(Serial1.available() > 0) {
    SerialUSB.write(Serial1.read());
  }
  if(millis() - led_timer > led_blink_time) {
    led_timer = millis();
    led_state = !led_state;
    digitalWrite(LED_BUILTIN, led_state);
  }
}
