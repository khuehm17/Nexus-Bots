
#ifndef SONAR_H
#define SONAR_H

#if defined(ARDUINO) && ARDUINO >= 100
#include "Arduino.h"
#else
#include "WProgram.h"
#endif

/*
#ifndef DEBUG
#define DEBUG
#endif
 */

/*for maple*/
#if defined(BOARD_maple) || defined(BOARD_maple_native) || defined(BOARD_maple_mini)
#include <io.h>

#define Serial Serial2
#define SonarPrint SerialUSB

/*for arduino*/
#else
#define SonarPrint Serial
#endif

#ifdef DEBUG
#define debug()                   \
	{                             \
		Serial.begin(baudRate);   \
		Serial.println(__func__); \
	}
#else
#define debug() \
	{           \
	}
#endif

class SONAR
{
public:
	SONAR(unsigned char addr = 0x11);
	unsigned char sendCmd(unsigned char *cmd, unsigned char size);
	unsigned char recvDat(unsigned char size = bufSize);
	char checksum(unsigned char size = bufSize);
	unsigned char showDat(unsigned char size = bufSize);
	unsigned char setAddr(unsigned char addr = 0);
	static void init(unsigned char pinCtrl = 13, unsigned int baudrate = baudRate);
	static void release();
	unsigned char trigger();
	unsigned int getDist();
	int getTemp();
	unsigned int update();

	unsigned char getAddr() const;
	unsigned char initAddr(unsigned char addr);

	static unsigned char getPinCtrl();
	static unsigned char setPinCtrl(unsigned char pinCtrl);
	static bool setMode(bool mode);
	static bool setTX();
	static bool setRX();

	enum
	{
		MODERX = LOW,
		MODETX = HIGH,

/*for maple*/
#if defined(BOARD_maple) || defined(BOARD_maple_native) || defined(BOARD_maple_mini)
		keyS7 = BOARD_BUTTON_PIN,
		KEYPRESSED = HIGH,

/*for arduino*/
#else
		keyS7 = 3,
		KEYPRESSED = LOW,
#endif

		addrCmdSize = 7,
		addrDatSize = 7,
		trigCmdSize = 6,
		distCmdSize = 6,
		distDatSize = 8,
		tempCmdSize = 6,
		tempDatSize = 8,
		bufSize = 8,
		duration = 50,
		baudRate = 19200,
	};

private:
	static const unsigned char addrCmdTemplate[addrCmdSize];
	// static const unsigned char addrDatTemplate[addrDatSize];
	static const unsigned char trigCmdTemplate[trigCmdSize];
	static const unsigned char distCmdTemplate[distCmdSize];
	// static const unsigned char distDattemplate[distDatSize];
	static const unsigned char tempCmdTemplate[tempCmdSize];
	// static const unsigned char tempDatTemplate[tempDatSize];

	static unsigned char _pinCtrl;

	// static bool _mode;
	// static bool getMode();

	unsigned char _addr;

	unsigned char _trigCmd[sizeof(trigCmdTemplate)];
	unsigned char _distCmd[sizeof(distCmdTemplate)];

	/*static*/ unsigned char _recvBuf[bufSize];

	static unsigned char *generateAddrCmd(unsigned char *addrCmd, unsigned char addr);
	static unsigned char *generateTempCmd(unsigned char *tempCmd, unsigned char addr);

	unsigned char *generateTrigCmd();
	unsigned char *generateDistCmd();

	/*static*/ unsigned char clearBuf();

	/*
	static const unsigned char dev11Addr[]={0x55,0xaa,0xab,0x01,0x55,0x11,0x11};
	static const unsigned char dev11Act[]={0x55,0xaa,0x11,0x00,0x01,0x11};
	static const unsigned char dev11Get[]={0x55,0xaa,0x11,0x00,0x02,0x12};
	 */
};

#endif
