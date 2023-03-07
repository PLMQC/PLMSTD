report 33000909 "Yearly PMR Schedule (W/M) B2B"
{

    DefaultLayout = RDLC;
    RDLCLayout = 'BCSTDPLM_Wave2\Reports\Layouts\Yearly PMR Schedule (WM).rdl';

    Caption = 'Yearly PMR Schedule (W/M)';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
        dataitem(Equipment; "Equipment B2B")
        {
            DataItemTableView = SORTING("No.");
            column(FrequencyName_____for_the_month_____FORMAT_Month___________FORMAT_Year_; 'Yearly Schedule ' + ' ' + 'for the All Months in the Year ' + ' ' + FORMAT(YearGVar))
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
            column(Yearly_Maintainance_ScheduleCaption; Yearly_Maintainance_ScheduleCaptionLbl)
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
                        if MonthGVar <> 0 then begin
                            if (DATE2DMY(TempDate, 2) = MonthGVar) and (DATE2DMY(TempDate, 3) = YearGVar) then begin
                                Day := DATE2DMY(TempDate, 2);
                                if (FORMAT(Frequency."Time Interval") = '<1M>') or (FORMAT(Frequency."Time Interval") = '<30D>') then
                                    Months[Day] := 'M'
                                else
                                    if (FORMAT(Frequency."Time Interval") = '<1Y>') or (FORMAT(Frequency."Time Interval") = '<365D>') then
                                        Months[Day] := FORMAT(TempDate)
                                    else
                                        if (FORMAT(Frequency."Time Interval") > '<1Y>') then
                                            Months[Day] := FORMAT(TempDate);
                            end;
                        end else
                            if (DATE2DMY(TempDate, 3) = YearGVar) then begin
                                Day := DATE2DMY(TempDate, 2);
                                if (FORMAT(Frequency."Time Interval") = '<1M>') or (FORMAT(Frequency."Time Interval") = '<30D>') then
                                    Months[Day] := 'M'
                                else
                                    if (FORMAT(Frequency."Time Interval") = '<1Y>') or (FORMAT(Frequency."Time Interval") = '<365D>') then
                                        Months[Day] := FORMAT(TempDate)
                                    else
                                        if (FORMAT(Frequency."Time Interval") > '<1Y>') then
                                            Months[Day] := FORMAT(TempDate);
                            end;
                        TempDate := CALCDATE(DateInterval, TempDate);
                    until MonthGVar < DATE2DMY(TempDate, 2);
                end;
            end;

            trigger OnPreDataItem();
            begin
                Frequency.GET(YearlyTextLbl);
            end;
        }
    }

    requestpage
    {
        Caption = 'Yearly PMR Schedule (W/M)';

        layout
        {
            area(content)
            {
                group(Caption)
                {
                    Caption = 'Options';
                    field(FrequencyName; FrequencyNameGVar)
                    {
                        Caption = 'Frequency Name';
                        TableRelation = "Frequency  B2B";
                        Visible = false;
                        ApplicationArea = All;
                        ToolTip = 'It Defines Frequency name.';

                        trigger OnLookup(Var Text: Text): Boolean;
                        begin
                            Frequency.RESET();
                            if PAGE.RUNMODAL(0, Frequency) = ACTION::LookupOK then begin
                                FrequencyNameGVar := Frequency.Code;
                                DateInterval := Frequency."Time Interval";
                            end;
                        end;
                    }
                    field(Month; MonthGVar)
                    {
                        Caption = 'Month';
                        Visible = false;
                        ApplicationArea = All;
                        ToolTip = 'It Defines Month.';
                    }
                    field(Year; YearGVar)
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
            YearGVar := DATE2DMY(WORKDATE(), 3);

            Frequency.RESET();
            Frequency.SETRANGE(Code, MonthlyTextLbl);
            if Frequency.FINDFIRST() then begin
                FrequencyNameGVar := Frequency.Code;
                DateInterval := Frequency."Time Interval";
            end;
        end;
    }

    labels
    {
    }

    var
        MaintainanceschedulePart: Record "Maintenance Schedule Part B2B";
        Frequency: Record "Frequency  B2B";
        DateInterval: DateFormula;
        Months: array[12] of Text;
        Day: Integer;
        MonthGVar: Integer;
        YearGVar: Integer;
        FrequencyNameGVar: Text[50];
        TempDate: Date;
        StartDate: Date;
        EndDate: Date;

        Yearly_Maintainance_ScheduleCaptionLbl: Label 'Yearly Maintenance Schelude';
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
        TimeInterval: Date;
        NoOfDaysGVar: Integer;
        YearlyTextLbl: Label 'YEARLY';
        MonthlyTextLbl: Label 'MONTHLY';
    //MonthDateTextLbl: Label '1M';

    procedure CalDates();
    begin
        StartDate := DMY2DATE(1, MonthGVar, YearGVar);
        EndDate := CALCDATE('<1M>', StartDate) - 1;
    end;
}

