/*
 *  Mandatory includes
 */
#include <Arduino.h>
#include <TinyMPU6050.h>
#include <Adafruit_NeoPixel.h>

// Which pin on the Arduino is connected to the NeoPixels?
#define PIN        6 // On Trinket or Gemma, suggest changing this to 1

// How many NeoPixels are attached to the Arduino?
#define NUMPIXELS 48 // Popular NeoPixel ring size

// When setting up the NeoPixel library, we tell it how many pixels,
// and which pin to use to send signals. Note that for older NeoPixel
// strips you might need to change the third parameter -- see the
// strandtest example for more information on possible values.
Adafruit_NeoPixel pixels(NUMPIXELS, PIN, NEO_GRB + NEO_KHZ800);

/*
 *  Constructing MPU-6050
 */
MPU6050 mpu (Wire);

/*
 *  Method that prints everything
 */
void PrintGets () {
//  Serial.print(mpu.GetRawAccX());
//  Serial.print(",");
//  Serial.print(mpu.GetRawAccY());
//  Serial.print(",");
//  Serial.println(mpu.GetRawAccZ());

  // Shows offsets
  Serial.println("--- Offsets:");
  Serial.print("AccX Offset = ");
  Serial.println(mpu.GetAccXOffset());
  Serial.print("AccY Offset = ");
  Serial.println(mpu.GetAccYOffset());
  Serial.print("AccZ Offset = ");
  Serial.println(mpu.GetAccZOffset());
  Serial.print("GyroX Offset = ");
  Serial.println(mpu.GetGyroXOffset());
  Serial.print("GyroY Offset = ");
  Serial.println(mpu.GetGyroYOffset());
  Serial.print("GyroZ Offset = ");
  Serial.println(mpu.GetGyroZOffset());
  // Shows raw data
  Serial.println("--- Raw data:");
  Serial.print("Raw AccX = ");
  Serial.println(mpu.GetRawAccX());
  Serial.print("Raw AccY = ");
  Serial.println(mpu.GetRawAccY());
  Serial.print("Raw AccZ = ");
  Serial.println(mpu.GetRawAccZ());
  Serial.print("Raw GyroX = ");
  Serial.println(mpu.GetRawGyroX());
  Serial.print("Raw GyroY = ");
  Serial.println(mpu.GetRawGyroY());
  Serial.print("Raw GyroZ = ");
  Serial.println(mpu.GetRawGyroZ());
  // Show readable data
  Serial.println("--- Readable data:");
  Serial.print("AccX = ");
  Serial.print(mpu.GetAccX());
  Serial.println(" m/s²");
  Serial.print("AccY = ");
  Serial.print(mpu.GetAccY());
  Serial.println(" m/s²");
  Serial.print("AccZ = ");
  Serial.print(mpu.GetAccZ());
  Serial.println(" m/s²");
  Serial.print("GyroX = ");
  Serial.print(mpu.GetGyroX());
  Serial.println(" degrees/second");
  Serial.print("GyroY = ");
  Serial.print(mpu.GetGyroY());
  Serial.println(" degrees/second");
  Serial.print("GyroZ = ");
  Serial.print(mpu.GetGyroZ());
  Serial.println(" degrees/second");
  // Show angles based on accelerometer only
  Serial.println("--- Accel angles:");
  Serial.print("AccelAngX = ");
  Serial.println(mpu.GetAngAccX());
  Serial.print("AccelAngY = ");
  Serial.println(mpu.GetAngAccY());
  Serial.print("AccelAngZ = ");
  Serial.println(mpu.GetAngAccZ());
  // Show angles based on gyroscope only
  Serial.println("--- Gyro angles:");
  Serial.print("GyroAngX = ");
  Serial.println(mpu.GetAngGyroX());
  Serial.print("GyroAngY = ");
  Serial.println(mpu.GetAngGyroY());
  Serial.print("GyroAngZ = ");
  Serial.println(mpu.GetAngGyroZ());
  // Show angles based on both gyroscope and accelerometer
  Serial.println("--- Filtered angles:");
  Serial.print("FilteredAngX = ");
  Serial.println(mpu.GetAngX());
  Serial.print("FilteredAngY = ");
  Serial.println(mpu.GetAngY());
  Serial.print("FilteredAngZ = ");
  Serial.println(mpu.GetAngZ());
  // Show filter coefficients
  Serial.println("--- Angle filter coefficients:");
  Serial.print("Accelerometer percentage = ");
  Serial.print(mpu.GetFilterAccCoeff());
  Serial.println('%');
  Serial.print("Gyroscope percentage = ");
  Serial.print(mpu.GetFilterGyroCoeff());
  Serial.println('%');
  // Show accel/gyro deadzones
  Serial.println("--- Deadzone:");
  Serial.print("Accelerometer deadzone = ");
  Serial.print(mpu.GetAccelDeadzone());
  Serial.println(" m/s²");
  Serial.print("Gyroscope deadzone = ");
  Serial.print(mpu.GetGyroDeadzone());
  Serial.println(" degrees/second");
}

/*
 *  Setup
 */
void setup() {

  // Initialization
  mpu.Initialize();

  // Calibration
  Serial.begin(115200);
  Serial.println("=====================================");
  Serial.println("Starting calibration...");
  mpu.Calibrate();
  Serial.println("Calibration complete!");

  pixels.begin();
}

/*
 *  Loop
 */
void loop() {
  
  PrintGets();
  delay(300); // 30 sec delay

}