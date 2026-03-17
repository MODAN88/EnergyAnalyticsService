# Full Stack Challenge: Energy Monitoring System

ברוך הבא למשימת ההערכה הטכנית שלנו!
המטרה של תרגיל זה היא לבחון את היכולת שלך לנתח מערכת קיימת, לייעל לוגיקה עסקית מורכבת ולהטמיע רכיבי AI חכמים. אנחנו שמים דגש על דרך החשיבה, הבנת תהליכים מהבסיס ושימוש ביקורתי בכלי פיתוח.

## מבנה המשימה

### חלק 1: ניתוח ולוגיקה (Backend - C#)
הפונקציה `CalculateEfficiencyMetrics` שופרה לביצועים טובים יותר (O(n)) וחישוב ממוצע נכון.

### חלק 2: נתונים וחשיבה רחבה (Database - MySQL)
שאילתה לזיהוי מכשירים עם ממוצע זרם ב-24 שעות האחרונות גבוה ב-20% לפחות מהממוצע ההיסטורי.
**אסטרטגיית אינדוקס:** אינדקסים על device_id, timestamp, ו-composite על שניהם ליעילות מקסימלית בטבלה עם 10 מיליון רשומות.

### חלק 3: ממשק משתמש ו-AI (Frontend - React)
רכיב Dashboard המציג מכשירים חריגים עם כפתור "Generate AI Insights" המדמה ניתוח AI.

## קבצים
- `EnergyAnalyticsService.cs`: קוד C# משופר.
- `database_setup.sql`: סכמה, אינדקסים, ושאילתה.
- `AIInsightsComponent.jsx`: רכיב React.
- `AIInsightsComponent.scss`: עיצוב SASS.
- `ai-prompts.md`: פרומפטים ששימשו עם AI.
- `additional_questions.md`: תשובות לשאלות להעמקה.

## כיצד להריץ
1. **C#:** קמפל את `EnergyAnalyticsService.cs` בסביבת .NET.
2. **MySQL:** הרץ את `database_setup.sql` ב-MySQL.
3. **React:** יבא את `AIInsightsComponent` לאפליקציית React עם נתוני anomalousDevices.