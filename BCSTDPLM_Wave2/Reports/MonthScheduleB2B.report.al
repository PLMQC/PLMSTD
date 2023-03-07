report 33000910 "Month Schedule B2B"
{

    DefaultLayout = RDLC;
    RDLCLayout = 'BCSTDPLM_Wave2\Reports\Layouts\Month Schedule.rdl';

    Caption = '"PMR Schedule "';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
        dataitem(Equipment; "Equipment B2B")
        {
            DataItemTableView = SORTING("No.");
            column(FrequencyName_____for_the_month_____FORMAT_Month___________FORMAT_Year_; FrequencyName + ' for the month ' + FORMAT(MonthGvar) + ', ' + FORMAT(YearGVar))
            {
            }
            column(Days_6_; Dates[6])
            {
            }
            column(Dates_1_; Dates[1])
            {
            }
            column(Days_2_; Dates[2])
            {
            }
            column(Days_3_; Dates[3])
            {
            }
            column(Days_4_; Dates[4])
            {
            }
            column(Days_5_; Dates[5])
            {
            }
            column(Days_8_; Dates[8])
            {
            }
            column(Days_7_; Dates[7])
            {
            }
            column(Days_13_; Dates[13])
            {
            }
            column(Days_16_; Dates[16])
            {
            }
            column(Days_15_; Dates[15])
            {
            }
            column(Days_14_; Dates[14])
            {
            }
            column(Days_12_; Dates[12])
            {
            }
            column(Days_10_; Dates[10])
            {
            }
            column(Days_9_; Dates[9])
            {
            }
            column(Days_29_; Dates[29])
            {
            }
            column(Days_30_; Dates[30])
            {
            }
            column(Days_28_; Dates[28])
            {
            }
            column(Days_27_; Dates[27])
            {
            }
            column(Days_26_; Dates[26])
            {
            }
            column(Days_25_; Dates[25])
            {
            }
            column(Days_24_; Dates[24])
            {
            }
            column(Days_23_; Dates[23])
            {
            }
            column(Days_22_; Dates[22])
            {
            }
            column(Days_21_; Dates[21])
            {
            }
            column(Days_20_; Dates[20])
            {
            }
            column(Days_19_; Dates[19])
            {
            }
            column(Days_18_; Dates[18])
            {
            }
            column(Days_17_; Dates[17])
            {
            }
            column(Days_31_; Dates[31])
            {
            }
            column(Days_11_; Dates[11])
            {
            }
            column(Monthly_Maintainance_ScheduleCaption; Monthly_Maintainance_ScheduleCaptionLbl)
            {
            }
            column(NonWorkingdays; NonWorkingdaysLbl)
            {
            }
            column(Machine_No_Caption; Machine_No_CaptionLbl)
            {
            }
            column(Equipment_No_; "No.")
            {
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = SORTING(Number);
                column(Days_1__Number_; Days[1] [Number])
                {
                }
                column(Machine_Name; EquipNo)
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
                column(Visible; Visible)
                {
                }
                column(Integer_Number; Number)
                {
                }

                trigger OnAfterGetRecord();
                begin
                    if not EquipNoPrinted then begin
                        EquipNo := Equipment."No.";
                        EquipNoPrinted := true;
                    end else
                        EquipNo := '';
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

                EquipNoPrinted := false;
                CLEAR(Days);
                NoofRec := 0;
                EquipmentPMR.RESET();
                EquipmentPMR.SETRANGE("Machine ID", Equipment."No.");
                EquipmentPMR.SETFILTER(Date, '<>%1', 0D);
                if EquipmentPMR.FINDSET() then
                    repeat
                        CLEAR(TempDate);
                        TempDate := EquipmentPMR.Date;
                        if (DATE2DMY(TempDate, 2) = MonthGVar) and (DATE2DMY(TempDate, 3) = YearGvar) then begin
                            Day := DATE2DMY(TempDate, 1);
                            CLEAR(NoofRec);
                            CLEAR(Fre);
                            EquipmentPMR1.RESET();
                            EquipmentPMR1.SETRANGE("Machine ID", Equipment."No.");
                            EquipmentPMR1.SETRANGE(Date, EquipmentPMR.Date);
                            if EquipmentPMR1.FINDSET() then
                                repeat
                                    NoofRec += 1;
                                    Fre := COPYSTR(EquipmentPMR1.Frequency, 1, 1);
                                    //if CalendarMgmt.CheckDateStatus(PLMSetup."PM Calendar Code", TempDate, Description) then
                                    custCaldChangeLrec.Date := TempDate;
                                    CalendarMgmt.CheckDateStatus(custCaldChangeLrec);
                                    IF NOT custCaldChangeLrec.Nonworking THEN
                                        Fre := Fre;
                                    Days[Day] [NoofRec] := Fre;
                                    Visible := true;
                                until EquipmentPMR1.NEXT() = 0;
                        end;
                    until EquipmentPMR.NEXT() = 0;
            end;

            trigger OnPreDataItem();
            var
                custCaldChangeLrec: Record "Customized Calendar Change";
            begin
                PLMSetup.GET();

                FromDate := DMY2DATE(1, MonthGvar, YearGVar);
                ToDate := CALCDATE('<+1D>', CALCDATE('<1M>', FromDate));
                repeat
                    DatesValues[DATE2DMY(FromDate, 1)] := FromDate;
                    Dates[DATE2DMY(FromDate, 1)] := FORMAT(DATE2DMY(FromDate, 1));
                    //if CalendarMgmt.CheckDateStatus(PLMSetup."PM Calendar Code", FromDate, Description) then
                    custCaldChangeLrec.Date := FromDate;
                    CalendarMgmt.CheckDateStatus(custCaldChangeLrec);
                    IF NOT custCaldChangeLrec.Nonworking THEN
                        Dates[DATE2DMY(FromDate, 1)] := LeftBracketLbl + Dates[DATE2DMY(FromDate, 1)] + RightBracketLbl;
                    FromDate := CALCDATE('<+1D>', FromDate);
                until FromDate > ToDate;
            end;
        }
    }

    requestpage
    {
        Caption = 'Month Schedule';

        layout
        {
            area(content)
            {
                group(Caption2)
                {
                    Caption = 'Options';
                    field(Month; MonthGvar)
                    {
                        Caption = 'Month';
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
            MonthGvar := DATE2DMY(WORKDATE(), 2);
            YearGVar := DATE2DMY(WORKDATE(), 3);
        end;
    }

    labels
    {
    }

    var
        PLMSetup: Record "Plant Maintenance Setup B2B";
        EquipmentPMR: Record "Equipment PMR Schedule B2B";
        EquipmentPMR1: Record "Equipment PMR Schedule B2B";
        CalendarMgmt: Codeunit "Calendar Management";
        Days: array[31, 20] of Text[30];
        Dates: array[31] of text[30];
        Monthly_Maintainance_ScheduleCaptionLbl: Label 'Monthly Maintainance Schedule';
        NonWorkingdaysLbl: Label 'The Dates in this ( ) are the Non Working Days.';
        Machine_No_CaptionLbl: Label 'Machine No.';
        LeftBracketLbl: Label '(';
        RightBracketLbl: Label ')';
        Day: Integer;
        MonthGVar: Integer;
        YearGVar: Integer;
        TempDate: Date;
        Fre: Text[30];
        NoofRec: Integer;
        EquipNo: Code[20];
        EquipNoPrinted: Boolean;
        FromDate: Date;
        ToDate: Date;
        DatesValues: array[31] of Date;
        FrequencyName: Text[30];
        Visible: Boolean;

}

