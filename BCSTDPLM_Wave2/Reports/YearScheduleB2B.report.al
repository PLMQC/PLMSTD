report 33000911 "Year Schedule B2B"
{

    DefaultLayout = RDLC;
    RDLCLayout = 'BCSTDPLM_Wave2\Reports\Layouts\Year Schedule.rdl';

    Caption = 'Year Schedule';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
        dataitem(Date; Date)
        {
            DataItemTableView = SORTING("Period Type", "Period Start") WHERE("Period Type" = CONST(Month), "Period No." = FILTER(1 .. 12));
            column(FrequencyName_____for_the_month_____FORMAT_Month___________FORMAT_Year_; FORMAT(YearGvar))
            {
            }
            column(Yearly_Maintainance_ScheduleCaption; Yearly_Maintainance_ScheduleCaptionLbl)
            {
            }
            column(V31Caption; V31CaptionLbl)
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
            column(V10Caption; V10CaptionLbl)
            {
            }
            column(V9Caption; V9CaptionLbl)
            {
            }
            column(V8Caption; V8CaptionLbl)
            {
            }
            column(V7Caption; V7CaptionLbl)
            {
            }
            column(V6Caption; V6CaptionLbl)
            {
            }
            column(V5Caption; V5CaptionLbl)
            {
            }
            column(V4Caption; V4CaptionLbl)
            {
            }
            column(V3Caption; V3CaptionLbl)
            {
            }
            column(V2Caption; V2CaptionLbl)
            {
            }
            column(V1Caption; V1CaptionLbl)
            {
            }
            column(Machine_NameCaption; Machine_NameCaptionLbl)
            {
            }
            column(Date_Period_Type; "Period Type")
            {
            }
            column(Date_Period_Start; "Period Start")
            {
            }
            dataitem(Equipment; "Equipment B2B")
            {
                DataItemTableView = SORTING("No.");
                RequestFilterFields = "No.";
                column(Equipment_No_; "No.")
                {
                }
                dataitem("Integer"; "Integer")
                {
                    DataItemTableView = SORTING(Number);
                    column(Days_1__Number_; Days[1] [Number])
                    {
                    }
                    column(Date__Period_Name_; PeriodName)
                    {
                    }
                    column(Days_2__Number_; Days[2] [Number])
                    {
                    }
                    column(Days_3__Number_; Days[3] [Number])
                    {
                    }
                    column(Days_4__Number_; Days[4] [Number])
                    {
                    }
                    column(Days_5__Number_; Days[5] [Number])
                    {
                    }
                    column(Days_8__Number_; Days[8] [Number])
                    {
                    }
                    column(Days_7__Number_; Days[7] [Number])
                    {
                    }
                    column(Days_6__Number_; Days[6] [Number])
                    {
                    }
                    column(Days_13__Number_; Days[13] [Number])
                    {
                    }
                    column(Days_16__Number_; Days[16] [Number])
                    {
                    }
                    column(Days_15__Number_; Days[15] [Number])
                    {
                    }
                    column(Days_14__Number_; Days[14] [Number])
                    {
                    }
                    column(Days_12__Number_; Days[12] [Number])
                    {
                    }
                    column(Days_10__Number_; Days[10] [Number])
                    {
                    }
                    column(Days_9__Number_; Days[9] [Number])
                    {
                    }
                    column(Days_29__Number_; Days[29] [Number])
                    {
                    }
                    column(Days_30__Number_; Days[30] [Number])
                    {
                    }
                    column(Days_28__Number_; Days[28] [Number])
                    {
                    }
                    column(Days_27__Number_; Days[27] [Number])
                    {
                    }
                    column(Days_26__Number_; Days[26] [Number])
                    {
                    }
                    column(Days_25__Number_; Days[25] [Number])
                    {
                    }
                    column(Days_24__Number_; Days[24] [Number])
                    {
                    }
                    column(Days_23__Number_; Days[23] [Number])
                    {
                    }
                    column(Days_22__Number_; Days[22] [Number])
                    {
                    }
                    column(Days_21__Number_; Days[21] [Number])
                    {
                    }
                    column(Days_20__Number_; Days[20] [Number])
                    {
                    }
                    column(Days_19__Number_; Days[19] [Number])
                    {
                    }
                    column(Days_18__Number_; Days[18] [Number])
                    {
                    }
                    column(Days_17__Number_; Days[17] [Number])
                    {
                    }
                    column(Days_31__Number_; Days[31] [Number])
                    {
                    }
                    column(Days_11__Number_; Days[11] [Number])
                    {
                    }
                    column(Integer_Number; Number)
                    {
                    }

                    trigger OnAfterGetRecord();
                    begin
                        if not PeriodNameNotPrinted then begin
                            PeriodName := Date."Period Name";
                            PeriodNameNotPrinted := true;
                        end else
                            PeriodName := '';
                    end;

                    trigger OnPreDataItem();
                    begin
                        Integer.RESET();
                        Integer.SETRANGE(Number, 1, NoofRec);
                    end;
                }

                trigger OnAfterGetRecord();
                var
                    custCaldChangeLrec: Record "Customized Calendar Change";
                begin
                    RMonth := DATE2DMY(Date."Period Start", 2);
                    RYear := DATE2DMY(Date."Period Start", 3);

                    PeriodNameNotPrinted := false;
                    CLEAR(Day);
                    CLEAR(Days);
                    CLEAR(TempDate);
                    EquipmentPMR2.RESET();
                    EquipmentPMR2.SETRANGE("Machine ID", Equipment."No.");
                    EquipmentPMR2.SETRANGE(Date, Date."Period Start", Date."Period End");
                    if EquipmentPMR2.FINDSET() then
                        repeat
                            CLEAR(TempDate);
                            TempDate := EquipmentPMR2.Date;
                            if (DATE2DMY(TempDate, 2) = RMonth) and (DATE2DMY(TempDate, 3) = RYear) then begin
                                Day := DATE2DMY(TempDate, 1);
                                CLEAR(NoofRec);
                                CLEAR(Fre);
                                CLEAR(Fre2);

                                EquipmentPMR3.RESET();
                                EquipmentPMR3.SETRANGE("Machine ID", Equipment."No.");
                                EquipmentPMR3.SETRANGE(Date, TempDate);
                                if EquipmentPMR3.FINDSET() then
                                    repeat
                                        NoofRec += 1;
                                        Fre := COPYSTR(EquipmentPMR3.Frequency, 1, 1);
                                        //if CalendarMgmt.CheckDateStatus(PLMSetup."PM Calendar Code", TempDate, Description) then
                                        custCaldChangeLrec.Date := TempDate;
                                        CalendarMgmt.CheckDateStatus(custCaldChangeLrec);
                                        IF NOT custCaldChangeLrec.Nonworking THEN
                                            Fre2 := LeftBracketLbl + Fre + RightBracketLbl;
                                        Days[Day] [NoofRec] := Fre2;
                                    until EquipmentPMR3.NEXT() = 0;
                            end;
                        until EquipmentPMR2.NEXT() = 0
                    else begin
                        CLEAR(NoofRec);
                        NoofRec := 1;
                        CLEAR(TempDate);
                        TempDate := (Date."Period Start");
                        Day := DATE2DMY(Date."Period Start", 1);
                        Days[Day] [NoofRec] := '';
                    end;
                end;

                trigger OnPreDataItem();
                begin
                    PLMSetup.GET();
                end;
            }

            trigger OnPreDataItem();
            begin
                if YearGvar = 0 then
                    ERROR(YearTextLbl);
                YearStartDate := DMY2DATE(1, 1, YearGvar);
                YearEndDate := DMY2DATE(31, 12, YearGvar);
                SETRANGE("Period Start", YearStartDate, YearEndDate);
            end;
        }
    }

    requestpage
    {
        Caption = 'PMR Schedule';

        layout
        {
            area(content)
            {
                group(Control1102152001)
                {
                    field(Year; YearGvar)
                    {
                        Caption = 'Year';
                        ApplicationArea = all;
                        ToolTip = 'It Defines The Year.';
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        EquipmentPMR2: Record "Equipment PMR Schedule B2B";
        EquipmentPMR3: Record "Equipment PMR Schedule B2B";
        PLMSetup: Record "Plant Maintenance Setup B2B";
        CalendarMgmt: Codeunit "Calendar Management";
        Days: array[31, 50] of Text[30];
        Day: Integer;
        YearGvar: Integer;
        TempDate: Date;
        YearStartDate: Date;
        YearEndDate: Date;
        RMonth: Integer;
        RYear: Integer;
        NoofRec: Integer;
        Fre: Text[28];
        Fre2: Text[30];
        PeriodName: Text[31];
        PeriodNameNotPrinted: Boolean;

        Yearly_Maintainance_ScheduleCaptionLbl: Label 'Yearly Maintainance Schedule';
        V31CaptionLbl: Label '31';
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
        V10CaptionLbl: Label '10';
        V9CaptionLbl: Label '9';
        V8CaptionLbl: Label '8';
        V7CaptionLbl: Label '7';
        V6CaptionLbl: Label '6';
        V5CaptionLbl: Label '5';
        V4CaptionLbl: Label '4';
        V3CaptionLbl: Label '3';
        V2CaptionLbl: Label '2';
        V1CaptionLbl: Label '1';
        Machine_NameCaptionLbl: Label 'Month Name';
        YearTextLbl: Label 'Enter the Year';
        LeftBracketLbl: Label '(';
        RightBracketLbl: Label ')';
}

