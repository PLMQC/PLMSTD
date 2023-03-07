report 33000908 "Monthly PMR Schedule (W/M) B2B"
{

    DefaultLayout = RDLC;
    RDLCLayout = 'BCSTDPLM_Wave2\Reports\Layouts\Monthly PMR Schedule (WM).rdl';

    Caption = 'Monthly PMR Schedule (W/M)';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
        dataitem(Equipment; "Equipment B2B")
        {
            DataItemTableView = SORTING("No.");
            column(FrequencyName_____for_the_month_____FORMAT_Month___________FORMAT_Year_; 'Monthly Schedule ' + ' ' + 'for the' + ' ' + MonthText + ' Month ' + ' ' + FORMAT(YearVar))
            {
            }
            column(Machine_Name; Name)
            {
            }
            column(Months_1_; Months[1])
            {
            }
            column(Months_2_; Months[2])
            {
            }
            column(Months_3_; Months[3])
            {
            }
            column(Months_4_; Months[4])
            {
            }
            column(Months_5_; Months[5])
            {
            }
            column(Months_6_; Months[6])
            {
            }
            column(Months_7_; Months[7])
            {
            }
            column(Months_8_; Months[8])
            {
            }
            column(Months_9_; Months[9])
            {
            }
            column(Months_10_; Months[10])
            {
            }
            column(Months_11_; Months[11])
            {
            }
            column(Months_12_; Months[12])
            {
            }
            column(Monthly_Maintainance_ScheduleCaption; Monthly_Maintainance_ScheduleCaptionLbl)
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
            column(V12Caption; V12CaptionLbl)
            {
            }
            column(V11Caption; V11CaptionLbl)
            {
            }
            column(Equipment_No_; "No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                CLEAR(Months);
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
                        if MonthVar <> 0 then begin
                            if (DATE2DMY(TempDate, 2) = MonthVar) and (DATE2DMY(TempDate, 3) = YearVar) then begin
                                Day := DATE2DMY(TempDate, 2);
                                if (FORMAT(Frequency."Time Interval") = '<1M>') or (FORMAT(Frequency."Time Interval") = '<30D>') then
                                    Months[Day] := FORMAT(TempDate)
                                else
                                    if (FORMAT(Frequency."Time Interval") = '<1Y>') or (FORMAT(Frequency."Time Interval") = '<365D>') then
                                        Months[Day] := 'Y'
                                    else
                                        if FORMAT(Frequency."Time Interval") > '<1M>' then
                                            Months[Day] := FORMAT(TempDate);
                            end;
                        end else
                            if (DATE2DMY(TempDate, 3) = YearVar) then begin
                                Day := DATE2DMY(TempDate, 2);
                                if (FORMAT(Frequency."Time Interval") = '<1M>') or (FORMAT(Frequency."Time Interval") = '<1M>') then
                                    Months[Day] := FORMAT(TempDate)
                                else
                                    if (FORMAT(Frequency."Time Interval") = '<1Y>') or (FORMAT(Frequency."Time Interval") = '<365D>') then
                                        Months[Day] := 'Y'
                                    else
                                        if FORMAT(Frequency."Time Interval") > '<1M>' then
                                            Months[Day] := FORMAT(TempDate)
                            end;
                        TempDate := CALCDATE(DateIntervalVar, TempDate);
                    until YearVar < DATE2DMY(TempDate, 3);
                end;
            end;

            trigger OnPreDataItem();
            begin
                if MonthVar <> 0 then
                    MonthText := FORMAT(MonthVar)
                else
                    MonthText := AllMonthsTextLbl;
            end;
        }
    }

    requestpage
    {
        Caption = 'Monthly PMR Schedule (W/M)';

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
                        ApplicationArea = All;
                        ToolTip = 'It Defines Frequency.';
                        Visible = false;

                        trigger OnLookup(Var Text: Text): Boolean;
                        begin

                            Frequency.RESET();
                            if PAGE.RUNMODAL(0, Frequency) = ACTION::LookupOK then begin
                                FrequencyNameVar := Frequency.Code;
                                DateIntervalVar := Frequency."Time Interval";
                            end;
                        end;
                    }
                    field(Month; MonthVar)
                    {
                        Caption = 'Month';
                        ApplicationArea = All;
                        ToolTip = 'It Defines Month.';
                    }
                    field(Year; YearVar)
                    {
                        Caption = 'Year';
                        ApplicationArea = All;
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
            YearVar := DATE2DMY(WORKDATE(), 3);

            Frequency.RESET();
            Frequency.SETRANGE(Code, MONTHLYTextLbl);
            if Frequency.FINDFIRST() then begin
                FrequencyNameVar := Frequency.Code;
                DateIntervalVar := Frequency."Time Interval";
            end;
        end;
    }

    labels
    {
    }

    var
        MaintainanceschedulePart: Record "Maintenance Schedule Part B2B";
        Frequency: Record "Frequency  B2B";
        DateIntervalVar: DateFormula;

        Months: array[12] of Text;
        Day: Integer;
        MonthVar: Integer;
        YearVar: Integer;
        FrequencyNameVar: Text[50];
        TempDate: Date;
        StartDateVar: Date;
        EndDate: Date;

        Monthly_Maintainance_ScheduleCaptionLbl: Label 'Monthly Maintenance Schelude';
        Machine_NameCaptionLbl: Label 'Machine Name';
        V1CaptionLbl: Label 'January';
        V2CaptionLbl: Label 'Febrauary';
        V3CaptionLbl: Label 'March';
        V4CaptionLbl: Label 'April';
        V5CaptionLbl: Label 'May';
        V6CaptionLbl: Label 'June';
        V7CaptionLbl: Label 'July';
        V8CaptionLbl: Label 'August';
        V9CaptionLbl: Label 'September';
        V10CaptionLbl: Label 'October';
        V11CaptionLbl: Label 'November';
        V12CaptionLbl: Label 'December';
        MonthText: Text;
        TimeInterval: Date;
        NoOfDaysGVar: Integer;
        AllMonthsTextLbl: Label 'All Months';
        MONTHLYTextLbl: Label 'MONTHLY';
    //MonthDateTextLbl: Label '<1M>';

    procedure CalDates();
    begin
        StartDateVar := DMY2DATE(1, MonthVar, YearVar);
        EndDate := CALCDATE('<1M>', StartDateVar) - 1;
    end;
}

