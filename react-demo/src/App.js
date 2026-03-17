import './App.css';
import AIInsightsComponent from './AIInsightsComponent';

function App() {
  // Sample anomalous devices data (normally from backend)
  const anomalousDevices = [
    {
      device_id: 'DEV001',
      recent_avg_current: 6.0,
      hist_avg_current: 5.1,
      percent_increase: 17.65
    },
    {
      device_id: 'DEV002',
      recent_avg_current: 5.5,
      hist_avg_current: 4.5,
      percent_increase: 22.22
    }
  ];

  return (
    <div className="App">
      <AIInsightsComponent anomalousDevices={anomalousDevices} />
    </div>
  );
}

export default App;
