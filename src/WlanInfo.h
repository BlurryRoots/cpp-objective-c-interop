#pragma once

#ifndef __WLANINFO_H__
#define __WLANINFO_H__

// Indicates the status of the wlan operation.
enum class WlanErrorCode {
	Success = 0,
	InvalidParamter = 1,
	InterfaceUnavailable = 2
};

// Holds info about a wlan connection.
struct WlanConnectionInfo
{
	char* InterfaceName;
    char* Ssid;
    long Rssi;
};

// Interface method, fetching the current connection info.
int GetCurrentWlanConnection(WlanConnectionInfo* WlanConnectionInfo);

#endif