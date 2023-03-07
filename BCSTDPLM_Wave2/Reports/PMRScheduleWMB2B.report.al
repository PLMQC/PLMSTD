report 33000896 "PMR Schedule (W/M) B2B"
{

    DefaultLayout = RDLC;
    RDLCLayout = 'BCSTDPLM_Wave2\Reports\Layouts\PMR Schedule (WM).rdl';

    Caption = '"PMR Schedule "';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
        dataitem(Equipment; "Equipment B2B")
        {
            DataItemTableView = SORTING("No.");
            column(FrequencyName_____for_the_month_____FORMAT_Month___________FORMAT_Year_; FrequencyNameVar + ' for the month ' + FORMAT(MonthVar) + ', ' + FORMAT(YearVar))
            {
            }
            column(Machine_Name; Name)
            {
            }
            column(Days_1_; Days[1])
            {
            }
            column(Days_2_; Days[2])
            {
            }
            column(Days_3_; Days[3])
            {
            }
            column(Days_4_; Days[4])
            {
            }
            column(Days_5_; Days[5])
            {
            }
            column(Days_8_; Days[8])
            {
            }
            column(Days_7_; Days[7])
            {
            }
            column(Days_6_; Days[6])
            {
            }
            column(Days_13_; Days[13])
            {
            }
            column(Days_16_; Days[16])
            {
            }
            column(Days_15_; Days[15])
            {
            }
            column(Days_14_; Days[14])
            {
            }
            column(Days_12_; Days[12])
            {
            }
            column(Days_10_; Days[10])
            {
            }
            column(Days_9_; Days[9])
            {
            }
            column(Days_29_; Days[29])
            {
            }
            column(Days_30_; Days[30])
            {
            }
            column(Days_28_; Days[28])
            {
            }
            column(Days_27_; Days[27])
            {
            }
            column(Days_26_; Days[26])
            {
            }
            column(Days_25_; Days[25])
            {
            }
            column(Days_24_; Days[24])
            {
            }
            column(Days_23_; Days[23])
            {
            }
            column(Days_22_; Days[22])
            {
            }
            column(Days_21_; Days[21])
            {
            }
            column(Days_20_; Days[20])
            {
            }
            column(Days_19_; Days[19])
            {
            }
            column(Days_18_; Days[18])
            {
            }
            column(Days_17_; Days[17])
            {
            }
            column(Days_31_; Days[31])
            {
            }
            column(Days_11_; Days[11])
            {
            }
            column(Preventive_Maintainance_ScheduleCaption; Preventive_Maintainance_ScheduleCaptionLbl)
            {
            }
            column(Machine_NameCaption; Machine_NameCaptionLbl)
            {
            }
            column(V1Caption; V1CaptionLbl)
            {
            }
            column(V2Caption; V2CaptionLbl)
            {
            }
            column(V3Caption; V3CaptionLbl)
            {
            }
            column(V4Caption; V4CaptionLbl)
            {
            }
            column(V5Caption; V5CaptionLbl)
            {
            }
            column(V6Caption; V6CaptionLbl)
            {
            }
            column(V7Caption; V7CaptionLbl)
            {
            }
            column(V8Caption; V8CaptionLbl)
            {
            }
            column(V9Caption; V9CaptionLbl)
            {
            }
            column(V10Caption; V10CaptionLbl)
            {
            }
            column(V30Caption; V30CaptionLbl)
            {
            }
            column(V29Caption; V29CaptionLbl)
            {
            }
            column(V28Caption; V28CaptionLbl)
            {
            }
            column(V27Caption; V27CaptionLbl)
            {
            }
            column(V26Caption; V26CaptionLbl)
            {
            }
            column(V25Caption; V25CaptionLbl)
            {
            }
            column(V24Caption; V24CaptionLbl)
            {
            }
            column(V23Caption; V23CaptionLbl)
            {
            }
            column(V22Caption; V22CaptionLbl)
            {
            }
            column(V21Caption; V21CaptionLbl)
            {
            }
            column(V20Caption; V20CaptionLbl)
            {
            }
            column(V19Caption; V19CaptionLbl)
            {
            }
            column(V18Caption; V18CaptionLbl)
            {
            }
            column(V17Caption; V17CaptionLbl)
            {
            }
            column(V16Caption; V16CaptionLbl)
            {
            }
            column(V15Caption; V15CaptionLbl)
            {
            }
            column(V14Caption; V14CaptionLbl)
            {
            }
            column(V13Caption; V13CaptionLbl)
            {
            }
            column(V12Caption; V12CaptionLbl)
            {
            }
            column(V11Caption; V11CaptionLbl)
            {
            }
            column(V31Caption; V31CaptionLbl)
            {
            }
            column(Equipment_No_; "No.")
            {
            }
            column(IsMonthDays28; IsMonthDays28)
            {
            }
            column(IsMonthDays31; IsMonthDays31)
            {
            }
            column(IsMonthdays30; IsMonthdays30)
            {
            }
            column(IsLeapyear; IsLeapyear)
            {
            }

            trigger OnAfterGetRecord();
            begin
                CLEAR(Days);
                CLEAR(TempDate);
                MaintainanceschedulePart.RESET();
                MaintainanceschedulePart.SETRANGE("Machine ID", Equipment."No.");
                MaintainanceschedulePart.SETRANGE("Frequency ID", Frequency.Code);
                MaintainanceschedulePart.SETFILTER("Start Date", '<>%1', 0D);
                if MaintainanceschedulePart.FINDFIRST() then begin
                    TempDate := MaintainanceschedulePart."Next Due Date";
                    TimeInterval := CALCDATE(Frequency."Time Interval");
                    NoOfDaysGVar := TimeInterval - TODAY();
                    repeat
                        if (DATE2DMY(TempDate, 2) = MonthVar) and (DATE2DMY(TempDate, 3) = YearVar) then begin
                            Day := DATE2DMY(TempDate, 1);
                            if FORMAT(Frequency."Time Interval") = DateTextOneLbl then
                                for Day := Day to 31 do
                                    Days[Day] := DateTextLbl
                            else
                                if FORMAT(Frequency."Time Interval") = DateTextSevenLbl then
                                    while (Day > 0) do begin
                                        Days[Day] := WeekTextLbl;
                                        Day := Day + 7;
                                        if Day > 31 then
                                            exit;
                                        Days[Day] := WeekTextLbl;
                                    end
                                else
                                    if (FORMAT(Frequency."Time Interval") = MonthTextOneLbl) or (FORMAT(Frequency."Time Interval") = DateText30Lbl) then
                                        Days[Day] := MonthTextLbl
                                    else
                                        if (FORMAT(Frequency."Time Interval") = YearTextOneLbl) or (FORMAT(Frequency."Time Interval") = DateText365Lbl) then
                                            Days[Day] := YearTextLbl
                                        else
                                            if (FORMAT(Frequency."Time Interval") = DateText90Lbl) or (FORMAT(Frequency."Time Interval") = QuarterOneTextLbl) then
                                                Days[Day] := QuarterTextLbl
                                            else
                                                if FORMAT(Frequency."Time Interval") > DateText30Lbl then
                                                    Days[Day] := DateTextLbl
                                                else
                                                    if FORMAT(Frequency."Time Interval") < DateText30Lbl then
                                                        while (Day > 0) do begin
                                                            Days[Day] := DateTextLbl;
                                                            Day := Day + NoOfDaysGVar;
                                                            if Day > 31 then
                                                                exit;
                                                            Days[Day] := DateTextLbl;
                                                        end;

                        end;
                        TempDate := CALCDATE(DateInterval, TempDate);
                    until YearVar < DATE2DMY(TempDate, 3);
                end;
            end;

            trigger OnPreDataItem();
            begin
                PMSetup.GET();
                if MonthVar = 2 then begin
                    IsMonthDays28 := true;
                    IsMonthDays31 := false;
                    IsMonthdays30 := false;
                end else
                    if MonthVar in [1, 3, 5, 7, 8, 10, 12] then begin
                        IsMonthDays31 := true;
                        IsMonthdays30 := false;
                        IsMonthDays28 := false;
                    end else begin
                        IsMonthDays28 := false;
                        IsMonthDays31 := false;
                        IsMonthdays30 := true;
                    end;
                if ((YearVar mod 4) = 0) then
                    IsLeapyear := true;
            end;
        }
    }

    requestpage
    {
        Caption = 'PMR Schedule (W/M)';

        layout
        {
            area(content)
            {
                //Caption = 'Options';
                group(Caption)
                {
                    Caption = 'Options';
                    field(FrequencyName; FrequencyNameVar)
                    {
                        Caption = 'Frequency Name';
                        TableRelation = "Frequency  B2B";
                        ApplicationArea = all;
                        ToolTip = 'It Defines Frequency.';

                        trigger OnLookup(var Text: Text): Boolean
                        begin

                            Frequency.RESET();
                            if PAGE.RUNMODAL(0, Frequency) = ACTION::LookupOK then begin
                                FrequencyNameVar := Frequency.Code;
                                DateInterval := Frequency."Time Interval";
                            end;
                        end;
                    }
                    field(Month; MonthVar)
                    {
                        Caption = 'Month';
                        ApplicationArea = all;
                        ToolTip = 'It Defines Month.';
                    }
                    field(Year; YearVar)
                    {
                        Caption = 'Year';
                        ApplicationArea = all;
                        ToolTip = 'It Defines Year.';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage();
        begin
            MonthVar := DATE2DMY(WORKDATE(), 2);
            YearVar := DATE2DMY(WORKDATE(), 3);
        end;
    }

    labels
    {
    }

    var
        MaintainanceschedulePart: Record "Maintenance Schedule Part B2B";
        PMSetup: Record "Plant Maintenance Setup B2B";
        Frequency: Record "Frequency  B2B";
        DateInterval: DateFormula;
        Days: array[31] of Text;
        Day: Integer;
        MonthVar: Integer;
        YearVar: Integer;
        FrequencyNameVar: Text[50];
        TempDate: Date;
        StartDate: Date;
        EndDate: Date;
        Preventive_Maintainance_ScheduleCaptionLbl: Label 'Preventive Maintainance Schedule';
        Machine_NameCaptionLbl: Label 'Machine Name';
        V1CaptionLbl: Label '1';
        V2CaptionLbl: Label '2';
        V3CaptionLbl: Label '3';
        V4CaptionLbl: Label '4';
        V5CaptionLbl: Label '5';
        V6CaptionLbl: Label '6';
        V7CaptionLbl: Label '7';
        V8CaptionLbl: Label '8';
        V9CaptionLbl: Label '9';
        V10CaptionLbl: Label '10';
        V30CaptionLbl: Label '30';
        V29CaptionLbl: Label '29';
        V28CaptionLbl: Label '28';
        V27CaptionLbl: Label '27';
        V26CaptionLbl: Label '26';
        V25CaptionLbl: Label '25';
        V24CaptionLbl: Label '24';
        V23CaptionLbl: Label '23';
        V22CaptionLbl: Label '22';
        V21CaptionLbl: Label '21';
        V20CaptionLbl: Label '20';
        V19CaptionLbl: Label '19';
        V18CaptionLbl: Label '18';
        V17CaptionLbl: Label '17';
        V16CaptionLbl: Label '16';
        V15CaptionLbl: Label '15';
        V14CaptionLbl: Label '14';
        V13CaptionLbl: Label '13';
        V12CaptionLbl: Label '12';
        V11CaptionLbl: Label '11';
        V31CaptionLbl: Label '31';
        DateTextLbl: Label 'D';
        DateTextOneLbl: Label '1D';
        DateTextSevenLbl: Label '7D';
        WeekTextLbl: Label 'W';
        MonthTextOneLbl: Label '1M';
        MonthTextLbl: Label 'M';
        QuarterOneTextLbl: Label '1Q';
        QuarterTextLbl: Label 'Q';
        DateText365Lbl: Label '365D';
        YearTextOneLbl: Label '1Y';
        YearTextLbl: Label 'Y';
        DateText30Lbl: Label '30D';

        DateText90Lbl: Label '90D';
        IsMonthDays28: Boolean;
        IsMonthDays31: Boolean;
        IsMonthdays30: Boolean;
        IsLeapyear: Boolean;
        TimeInterval: Date;
        NoOfDaysGVar: Integer;

    procedure CalDates();
    begin
        StartDate := DMY2DATE(1, MonthVar, YearVar);
        EndDate := CALCDATE('<1M>', StartDate) - 1;
    end;
}

