import React, { useState } from 'react';
import './AIInsightsComponent.scss';

const AIInsightsComponent = ({ anomalousDevices }) => {
  const [insights, setInsights] = useState({});

  const generateInsights = (deviceId) => {
    // Simulate AI analysis
    const mockInsights = {
      'DEV001': 'שילוב של טמפרטורה גבוהה וזרם חריג מצביע על כשל במערכת הקירור.',
      'DEV002': 'עלייה בזרם ללא שינוי בוולטאז מצביעה על עומס יתר במערכת.'
    };
    setInsights(prev => ({ ...prev, [deviceId]: mockInsights[deviceId] || 'ניתוח AI זמין בקרוב.' }));
  };

  return (
    <div className="dashboard-container">
      <h2>Dashboard - מכשירים חריגים</h2>
      <div className="devices-list">
        {anomalousDevices.map((device) => (
          <div key={device.device_id} className="device-card">
            <h3>מכשיר: {device.device_id}</h3>
            <p>ממוצע זרם 24 שעות: {device.recent_avg_current.toFixed(2)}</p>
            <p>ממוצע היסטורי: {device.hist_avg_current.toFixed(2)}</p>
            <p>עלייה באחוזים: {device.percent_increase.toFixed(2)}%</p>
            <button onClick={() => generateInsights(device.device_id)}>
              Generate AI Insights
            </button>
            {insights[device.device_id] && (
              <p className="insight-text">{insights[device.device_id]}</p>
            )}
          </div>
        ))}
      </div>
    </div>
  );
};

export default AIInsightsComponent;