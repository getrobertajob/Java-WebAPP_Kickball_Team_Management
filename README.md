# Java-WebAPP_Kickball_Team_Management
A Java Web App for a Kickball League. Users can manage teams by creating, assigning players, deleting. Includes User registration &amp; Login.


User Registration
1) User Name  
   -checks against Database to limit duplicate user names.
3) Email  
      -checks against Database to limit duplicate emails.
5) Password
   -Hashes password for security.
7) Confirm Password  
   -checks against password for verification.

User Log in
1) Email
   -checks against database for existance and alerts user if not found.
3) Password  
   -checks against database for security.

Dashboard
1) Displays overview of teams for whole league with summary data.
2) Team Name
3) Skill Level
4) Roster Size
5) Scheduled game days

Create New Teams
1) standard creation form with data submitted to the database.

View Individual teams
1) Team Name
2) Username of who created it
3) Skill Level
4) Scheduled game days
5) Player roster
6) Form to add new players
   -checks database againt team roster size limit.
   -alerts user if the team has reached limit.
   -disables creation buttons if limit is reached.

Edit Teams
1) Standard form loaded with that teams data from the database with submit button
2) Option to delete team completely
