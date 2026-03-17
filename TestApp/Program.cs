using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        var service = new EnergyAnalyticsService();
        var data = new List<RawData>
        {
            new RawData { DeviceId = "DEV001", Voltage = 220, Current = 5, Temperature = 25 },
            new RawData { DeviceId = "DEV001", Voltage = 220, Current = 5.2, Temperature = 26 },
            new RawData { DeviceId = "DEV002", Voltage = 220, Current = 4.8, Temperature = 24 }
        };

        var results = service.CalculateEfficiencyMetrics(data);
        foreach (var result in results)
        {
            Console.WriteLine($"Device: {result.DeviceId}, TotalPower: {result.TotalPower}, Count: {result.ReadingsCount}, AvgEfficiency: {result.AverageEfficiency}");
        }
    }
}
