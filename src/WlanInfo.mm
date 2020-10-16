// Core library for wlan features
#import <CoreWLAN/CoreWLAN.h>
// Custom wrapper declarations
#import "WlanInfo.h"

// Helper function creating a c string from NSString.
int StringFromNSString(char** Destination, NSString* Source) {
    if (nil == Source) {
        *Destination = nullptr;
        return -1;
    }

    const char* Value = [Source UTF8String];
    const int Length = [Source length];
    if (nil == Value) {
        *Destination = nullptr;
        return -1;
    }

    *Destination = (char*)malloc(Length + 1);
    strcpy(*Destination, Value);

    return Length;
}

// Interface method, fetching the current connection info.
int GetCurrentWlanConnection(WlanConnectionInfo* Info) {
    if (nil == Info) {
        return (int)WlanErrorCode::InvalidParamter;
    }

    @autoreleasepool {
        CWWiFiClient* Client = CWWiFiClient.sharedWiFiClient;

        CWInterface* currentInterface = Client.interface;
        if (false == [currentInterface powerOn]) {
            return (int)WlanErrorCode::InterfaceUnavailable;
        }

        StringFromNSString(&Info->InterfaceName, [currentInterface interfaceName]);
        StringFromNSString(&Info->Ssid, [currentInterface ssid]);
        Info->Rssi = (long)[currentInterface rssiValue];
    }

    return (int)WlanErrorCode::Success;
}