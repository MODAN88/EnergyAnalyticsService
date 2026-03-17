
using System;
using System.Collections.Generic;
using System.Linq;

public class EnergyAnalyticsService
{
    // Optimized function to calculate efficiency metrics with O(n) time complexity
    public List<DeviceResult> CalculateEfficiencyMetrics(List<RawData> data)
    {
        var deviceGroups = new Dictionary<string, (double totalPower, int count, double sumEfficiency)>();

        foreach (var item in data)
        {
            double powerUsage = item.Voltage * item.Current;
            double efficiencyFactor = Math.Pow(Math.Sqrt(powerUsage * 0.85), 2) / (item.Temperature + 1);

            if (deviceGroups.ContainsKey(item.DeviceId))
            {
                var (totalPower, count, sumEfficiency) = deviceGroups[item.DeviceId];
                deviceGroups[item.DeviceId] = (totalPower + powerUsage, count + 1, sumEfficiency + efficiencyFactor);
            }
            else
            {
                deviceGroups[item.DeviceId] = (powerUsage, 1, efficiencyFactor);
            }
        }

        return deviceGroups.Select(kvp => new DeviceResult
        {
            DeviceId = kvp.Key,
            TotalPower = kvp.Value.totalPower,
            ReadingsCount = kvp.Value.count,
            AverageEfficiency = kvp.Value.sumEfficiency / kvp.Value.count
        }).ToList();
    }
}

public class RawData
{
    public string DeviceId { get; set; }
    public double Voltage { get; set; }
    public double Current { get; set; }
    public double Temperature { get; set; }
}

public class DeviceResult
{
    public string DeviceId { get; set; }
    public double TotalPower { get; set; }
    public int ReadingsCount { get; set; }
    public double AverageEfficiency { get; set; }
}
