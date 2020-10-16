int MSGEQ_STROBE_PIN = 5;
int MSGEQ_RESET_PIN = 18;
int MSGEQ_ANALOG_PIN = 4;

int bandValues[7];
int bandNo;
 
//char buf[4];
 
void setup()
{
  Serial.begin(115200)

 
  pinMode(MSGEQ_RESET_PIN, OUTPUT);
  pinMode(MSGEQ_STROBE_PIN, OUTPUT);
 
  // RESET
  digitalWrite(MSGEQ_RESET_PIN, LOW);
  digitalWrite(MSGEQ_STROBE_PIN, HIGH);
}
 
void readMSGEQ7()
{
  digitalWrite(MSGEQ_RESET_PIN, HIGH);
  digitalWrite(MSGEQ_RESET_PIN, LOW);
 
  for (bandNo = 0; bandNo < 7; bandNo++)
  {
    digitalWrite(MSGEQ_STROBE_PIN, LOW);
    delayMicroseconds(30);
    bandValues[bandNo] = analogRead(ANALOG_PIN);
    digitalWrite(MSGEQ_STROBE_PIN, HIGH);
  }
}
 
void loop()
{
  // pobieramy amplitudy
  readMSGEQ7();
 
  // wyswietlamy kolejne zakresy
  for (bandNo = 0; bandNo < 7; bandNo++)
  {
   // sprintf(buf, "aa");
    
   // Serial.print(buf);
    Serial.printf("%4d ", bandValues[bandNo]);
  }
  Serial.println();
}
