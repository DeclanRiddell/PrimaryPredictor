-- This is the ADA homework assignment
-- Declan Riddell
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics.Elementary_Functions;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics.Elementary_Functions;


procedure adaHomework is
-- Take in the current state
-- Then take the number of candidates on a separate line by itself
-- Then each candidate's info on a separate line
-- The candiate's info will be the five items listed: (2-letter set of initials, 2-letter state, and 3 integers), all separated by spaces

    subtype State_Abbr is String(1..2);	-- Length-2 string for state
    subtype Initials is String(1..2);	-- Length-2 string for initials

	Current_State: State_Abbr;
	Cand_Name: Initials;
	Home_State: State_Abbr;
	Commercials: Natural;
	Days: Natural;
	Wins: Natural;
	Number_of_Cands: Natural;
	Space: Character;
	Score: Integer;
	Prev_Score: Integer;
		 --Continue from here to compute the scores
	
	function checkRegion(State: State_Abbr) return Integer is
	begin
		if State = "ME" or State = "NH" or State = "VT" or State = "MA" or State = "CT" or State = "RI" Then
			return 1;
		elsif State = "NY" or State = "PA" or State = "NJ" or State = "DE" or State = "MD" Then
			return 2;
		elsif State = "VA" or State = "NC" or State = "SC" or State = "GA" or State = "FL" or State = "AL" or State = "MS" or State = "TN" or State = "KY" or State = "WV" or State = "AR" or State = "LA" Then
			return 3;
		elsif State = "OH" or State = "MI" or State = "IN" or State = "IL" or State = "WI" or State = "MN" Then
			return 4;
		elsif State = "IA" or State = "MO" or State = "ND" or State = "SD" or State = "NE" or State = "KS" or State = "OK" or State = "TX" Then
			return 5;
		elsif State = "MT" or State = "WY" or State = "CO" or State = "NM" or State = "AZ" or State = "UT" or State = "ID" or State = "NV" Then
			return 6;
		elsif State = "WA" or State = "OR" or State = "CA" or State = "AK" or State = "HI" Then
			return 7;
		end if;

		return 0;
	end checkRegion;

begin
	
	Get(Current_State);
	Get(Number_of_Cands);
	for I in 1..Number_of_Cands loop
		Score := 0;
		Prev_Score := 0;
		Get(Cand_Name);
		Get(Space);	-- Skip the space between initials and state
		Get(Home_State);
		Get(Commercials);
		Get(Days);
		Get(Wins);
		Skip_Line;	-- Skip past the newline
		if Home_State = Current_State Then
			Score := 50;
		end if;
		if checkRegion(Current_State) = checkRegion(Home_State) Then
			Score := Score + 20;
		end if;
		if Commercials > 0 Then
			Commercials := (Commercials / 10);
			Score := Score + Commercials;
		end if;
		if Days > 0 Then
			Score := Score + Days;
		end if;
		if Wins > 0 Then
			Wins := (Wins * 5);
			Score := Score + Wins;
		end if;
		
		Put(Cand_Name);
		Put(Score - Prev_Score);
		New_Line;
		Prev_Score := Score;
	end loop;
	
end adaHomework;