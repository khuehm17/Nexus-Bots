
/*
V1.1	201104
1. motorwheel library version 1.1,compatible with maple.

V1.1.1	201110
1. Add Acceleration

V1.2	201207
1. Double CPR from 12 to 24, Interrupt Type from RISING to CHANGE.
2. Reduce default sample time from 10ms to 5ms.
3. Compatible with Namiki 22CL-3501PG80:1, by "#define _NAMIKI_MOTOR" before "#include ...".

V1.3	201209
1. R2WD::delayMS(), Omni3WD::delayMS(), Omni4WD::delayMS() are re-implemented, more exactly.
2. getSpeedRPM(), setSpeedRPM(), getSpeedMMPS(), setSpeedMMPS() are plug-minus/direction sensitive now.
3. Acceleration is disabled.

V1.4	201209	Not Released
1. Increase CPR from 24 to 48 for Faulhaber 2342.

V1.5	201209	Omni4WD is re-implemented, and now return value of Omni4WD::getSpeedMMPS() is correct.

 */

/*for maple*/
#if defined(BOARD_maple) || defined(BOARD_maple_native) || defined(BOARD_maple_mini)
#include "wirish.h"
#include "./../PID_Beta6/PID_Beta6.h"
#include "ext_interrupts.h"

/*for arduino*/
#else
//#include<Arduino.h>
//#include<WProgram.h>
#include <PID_Beta6.h>
#include <PinChangeInt.h>

#endif

/*
	class PID
	class Motor
	class GearedMotor
	class MotorWheel
 */

#ifndef MotorWheel_H
#define MotorWheel_H

#define DIR_ADVANCE HIGH
#define DIR_BACKOFF LOW

#define PIN_UNDEFINED 255
#define REF_VOLT 12
/*for maple*/
#if defined(BOARD_maple) || defined(BOARD_maple_native) || defined(BOARD_maple_mini)
#define MAX_PWM 3599

/*for arduino*/
#else
#define MAX_PWM 255

#endif

#ifdef _NAMIKI_MOTOR
#define TRIGGER CHANGE
#define CPR 4 // Namiki motor
#define DIR_INVERSE
#define REDUCTION_RATIO 80
#else
#define TRIGGER RISING
#define CPR 12 // Faulhaber motor
#define DIR_INVERSE !
#define REDUCTION_RATIO 64
#endif

#define MAX_SPEEDRPM 8000
//#define  DESIRED_SPEEDRPM 3000
//#define  SPEED_CONSTANT_RPM 713
//#define  PWM2SPEED_RESOLUTION 143 //713 * 0.2

#define SEC_PER_MIN 60
#define MICROS_PER_SEC 1000000
//#define  SPEEDPPS2SPEEDRPM(freq) ((freq)*((SEC_PER_MIN)/(CPR))) //(freq*SEC_PER_MIN/CPR)
#define SPEEDPPS2SPEEDRPM(freq) ((unsigned long)(freq) * (SEC_PER_MIN) / (CPR)) //(freq*SEC_PER_MIN/CPR)
//#define  SPEEDPPS2SPEED2VOLT(spd) ((spd)/SPEED_CONSTANT_RPM)
//#define  MAX_SPEEDPPS ((MAX_SPEEDRPM*CPR)/SEC_PER_MIN)
//#define  MIN_SPEEDPPS 0

#define KC 0.31
#define TAUI 0.02
#define TAUD 0.00
#define SAMPLETIME 5

#define Baudrate 19200
/*
#ifndef DEBUG
#define DEBUG
#endif
 */
#ifdef DEBUG
#define debug()                     \
	{                               \
		if (!Serial.available())    \
			Serial.begin(Baudrate); \
		Serial.println(__func__);   \
	}
#else
#define debug() \
	{           \
	}
#endif

// Interrupt Type: RISING --> CHANGE	201207
#define irqISR(y, x)                                                                       \
	void x();                                                                              \
	struct ISRVars y = {x};                                                                \
	void x()                                                                               \
	{                                                                                      \
		static bool first_pulse = true;                                                    \
		y.pulseEndMicros = micros();                                                       \
		if (first_pulse == false && y.pulseEndMicros > y.pulseStartMicros)                 \
		{                                                                                  \
			y.speedPPS = MICROS_PER_SEC / (y.pulseEndMicros - y.pulseStartMicros);         \
			/* y.accPPSS=(y.speedPPS-y.lastSpeedPPS)*y.speedPPS; */                        \
		}                                                                                  \
		else                                                                               \
			first_pulse = false;                                                           \
		y.pulseStartMicros = y.pulseEndMicros;                                             \
		/* y.lastSpeedPPS=y.speedPPS; */                                                   \
		if (y.pinIRQB != PIN_UNDEFINED)                                                    \
			y.currDirection = DIR_INVERSE(digitalRead(y.pinIRQ) ^ digitalRead(y.pinIRQB)); \
		y.currDirection == DIR_ADVANCE ? ++y.pulses : --y.pulses;                          \
	}

struct ISRVars
{
	void (*ISRfunc)();
	// volatile unsigned long pulses;
	volatile long pulses; // 201104, direction sensitive
	volatile unsigned long pulseStartMicros;
	volatile unsigned long pulseEndMicros;
	volatile unsigned int speedPPS;
	// volatile unsigned int  lastSpeedPPS;
	// volatile int accPPSS;	// acceleration, Pulse Per Sec^2
	volatile bool currDirection;
	unsigned char pinIRQB;
	unsigned char pinIRQ; // pinIRQA 201207
};

/**
 * Implementation of Nexus motor control class with PID algorithm 
 */
class Motor : public PID
{
public:
	Motor(unsigned char _pinPWM, unsigned char _pinDir,
		  unsigned char _pinIRQ, unsigned char _pinIRQB,
		  struct ISRVars *_isr);

	struct ISRVars* isr;
	
	void setupInterrupt();

	unsigned char getPinPWM() const;
	unsigned char getPinDir() const;
	unsigned char getPinIRQ() const;
	unsigned char getPinIRQB() const;

	unsigned int runPWM(unsigned int PWM, bool dir, bool saveDir = true);
	unsigned int getPWM() const;
	unsigned int advancePWM(unsigned int PWM);
	unsigned int backoffPWM(unsigned int PWM);

	bool setDesiredDir(bool dir);
	bool getDesiredDir() const;
	bool reverseDesiredDir();

	bool setCurrDir();
	bool getCurrDir() const;

	// int getAccRPMM() const;		// Acceleration, Round Per Min^2
	// unsigned int getSpeedRPM() const;
	// unsigned int setSpeedRPM(int speedRPM,bool dir);
	//  direction sensitive 201208
	int getSpeedRPM() const;
	unsigned int setSpeedRPM(int speedRPM, bool dir); // preserve
	int setSpeedRPM(int speedRPM);

	// void simpleRegulate();

	bool PIDSetup(float kc = KC, float taui = TAUI, float taud = TAUD, unsigned int sampleTime = 1000);
	bool PIDGetStatus() const;
	bool PIDEnable(float kc = KC, float taui = TAUI, float taud = TAUD, unsigned int sampleTime = 1000);
	bool PIDDisable();
	bool PIDReset();
	bool PIDRegulate(bool doRegulate = true);
	unsigned int PIDSetSpeedRPMDesired(unsigned int speedRPM);
	unsigned int PIDGetSpeedRPMDesired() const;

	void delayMS(unsigned int ms, bool debug = false);
	void debugger() const;

	// int getAccPPSS() const;
	int getSpeedPPS() const;
	long getCurrPulse() const;
	long setCurrPulse(long _pulse);
	long resetCurrPulse();

	

private:
	unsigned char pinPWM;
	unsigned char pinDir;
	// unsigned char pinIRQ;		// moved to isr
	// unsigned char pinIRQB;

	// bool currDirection;		// current direction
	bool desiredDirection; // desired direction
	unsigned int speedPWM; // current PWM

	int speedRPMInput;	 // RPM: Round Per Minute
	int speedRPMOutput;	 // RPM
	int speedRPMDesired; // RPM
	// float PWMEC;
	float speed2DutyCycle;
	/*
		// the followings are defined in struct ISRvars,
		// because ISR must be a global function, without parameters and no return value

		volatile unsigned int speedPPS;	// PPS: Pulses Per Second
		volatile unsigned long pulseStartMicros;
		volatile unsigned long pulseEndMicros;
	 */
	bool pidCtrl;

	Motor();
};

#ifndef REDUCTION_RATIO
#define REDUCTION_RATIO 64
#endif
/**
 * Implementation of Nexus geared motor control class with PID algorithm 
 */
class GearedMotor : public Motor
{ // RPM
public:
	GearedMotor(unsigned char _pinPWM, unsigned char _pinDir,
				unsigned char _pinIRQ, unsigned char _pinIRQB,
				struct ISRVars *_isr,
				unsigned int _ratio = REDUCTION_RATIO);
	// float getGearedAccRPMM() const;		// Acceleration, Round Per Min^2
	float getGearedSpeedRPM() const;
	float setGearedSpeedRPM(float gearedSpeedRPM, bool dir);
	// direction sensitive 201208
	float setGearedSpeedRPM(float gearedSpeedRPM);
	unsigned int getRatio() const;
	unsigned int setRatio(unsigned int ratio = REDUCTION_RATIO);

private:
	unsigned int _ratio;
};

#ifndef PI
#define PI 3.1416
#endif

#define CIRMM 314 // mm
/**
 * Implementation of Nexus motor wheel control class with PID algorithm 
 */
class MotorWheel : public GearedMotor
{ //
public:
	MotorWheel(unsigned char _pinPWM, unsigned char _pinDir,
			   unsigned char _pinIRQ, unsigned char _pinIRQB,
			   struct ISRVars *_isr,
			   unsigned int ratio = REDUCTION_RATIO, unsigned int cirMM = CIRMM);

	unsigned int getCirMM() const;
	unsigned int setCirMM(unsigned int cirMM = CIRMM);

	// direction sensitive 201208
	// int getAccCMPMM() const;	// Acceleration, CM Per Min^2
	int getSpeedCMPM() const;					 // cm/min
	int setSpeedCMPM(unsigned int cm, bool dir); // preserve
	int setSpeedCMPM(int cm);
	// int getAccMMPSS() const;	// Acceleration, MM Per Sec^2
	int getSpeedMMPS() const;					 // mm/s
	int setSpeedMMPS(unsigned int mm, bool dir); // preserve
	int setSpeedMMPS(int mm);

private:
	unsigned int _cirMM;
};

#endif
