#include <iostream>
#include "WlanInfo.h"

int main () {
    int CallResult;    
    WlanConnectionInfo Info;

    CallResult = GetCurrentWlanConnection(&Info);
    if (0 != CallResult) {
        std::cout << "{\"Error\": \"Could not fetch info! Error: " << CallResult << "\"}" << std::endl;
        std::cerr << "Could not fetch info! Error: " << CallResult << std::endl;
    }
    else {
        std::cout
            << " {\"InterfaceName\": \"" << Info.InterfaceName << "\""
            << ", \"Ssid\": \"" << Info.Ssid << "\""
            << ", \"Rssi\": " << Info.Rssi
            << "}" << std::endl;
    }

    return CallResult;
}