report 33000902 "PMR Schedule-Base Calendar B2B"
{


    Caption = 'PMR Schedule-Base Calendar';
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
        dataitem(Equipment; "Equipment B2B")
        {
            DataItemTableView = SORTING("No.");

            trigger OnAfterGetRecord();
            var
                custCaldChangeLrec: record "Customized Calendar Change";
            begin
                CLEAR(Days);
                CLEAR(TempDate);
                MaintainanceschedulePart.RESET();
                MaintainanceschedulePart.SETRANGE("Machine ID", Equipment."No.");
                MaintainanceschedulePart.SETRANGE("Frequency Name", FrequencyName);
                MaintainanceschedulePart.SETFILTER("Start Date", '<>%1', 0D);
                if MaintainanceschedulePart.FIND('-') then begin
                    MachinePMRSchedule.RESET();
                    MachinePMRSchedule.SETRANGE("Machine ID", MaintainanceschedulePart."Machine ID");
                    MachinePMRSchedule.SETRANGE("Maintainance Schedule Part ID", MaintainanceschedulePart."No.");
                    if not MachinePMRSchedule.FINDFIRST() then begin
                        TempDate := MaintainanceschedulePart."Start Date";
                        repeat
                            NoHoliday := false;
                            if (DATE2DMY(TempDate, 3) = Year) then begin
                                MachinePMRSchedule.INIT();
                                MachinePMRSchedule."Machine ID" := MaintainanceschedulePart."Machine ID";
                                MachinePMRSchedule.Frequency := MaintainanceschedulePart."Frequency ID";
                                MachinePMRSchedule."Maintainance Schedule Part ID" := MaintainanceschedulePart."No.";
                                MachinePMRSchedule."Equipment Location" := Equipment."Machine Location";
                                MachinePMRSchedule.Date := TempDate;
                                repeat
                                    /*
                                        if CalendarMgt.CheckDateStatus(PMSetup."PM Calendar Code", MachinePMRSchedule.Date) then
                                            MachinePMRSchedule.Date := CALCDATE('<+1D>', MachinePMRSchedule.Date)
                                        else
                                            NoHoliday := true;
                                    */
                                    //custCaldChangeLrec
                                    custCaldChangeLrec.Date := MachinePMRSchedule.Date;
                                    CalendarMgt.CheckDateStatus(custCaldChangeLrec);
                                    IF custCaldChangeLrec.Nonworking THEN
                                        MachinePMRSchedule.Date := CALCDATE('<+1D>', MachinePMRSchedule.Date)
                                    else
                                        NoHoliday := true;
                                until NoHoliday;

                                MachinePMRSchedule1.RESET();
                                MachinePMRSchedule1.SETRANGE("Machine ID", MaintainanceschedulePart."Machine ID");
                                MachinePMRSchedule1.SETRANGE("Maintainance Schedule Part ID", MaintainanceschedulePart."No.");
                                MachinePMRSchedule1.SETRANGE(Date, MachinePMRSchedule.Date);
                                if not MachinePMRSchedule1.FIND('-') then
                                    MachinePMRSchedule.INSERT();
                            end;
                            TempDate := CALCDATE(DateInterval, TempDate);
                        until Year < DATE2DMY(TempDate, 3);
                    end;
                end;
            end;

            trigger OnPostDataItem();
            begin
                MachinePMRSchedule.RESET();
                MachinePMRSchedule.SETRANGE(Frequency, FrequencyName);
                if MachinePMRSchedule.COUNT() > 0 then
                    MESSAGE(Text001Lbl)
                else
                    MESSAGE(Text002Lbl);
            end;

            trigger OnPreDataItem();
            begin
                MachinePMRSchedule.RESET();
                MESSAGE('%1', FrequencyName);
                MachinePMRSchedule.SETRANGE(Frequency, FrequencyName);
                MachinePMRSchedule.DELETEALL();
                PMSetup.GET();
            end;
        }
    }

    requestpage
    {
        Caption = 'PMR Schedule-Base Calendar';

        layout
        {
            area(content)
            {
                //Caption = 'Request Form';
                field("Frequeny Number"; FrequencyNumber)
                {
                    Caption = 'Frequeny Number';
                    ApplicationArea = all;
                    ToolTip = 'It Defines Frequency.';

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        if Frequency.GET() then;
                        if PAGE.RUNMODAL(0, Frequency) = ACTION::LookupOK then begin
                            FrequencyNumber := Frequency.Code;
                            FrequencyName := Frequency.Description;
                            DateInterval := Frequency."Time Interval";
                        end else begin
                            FrequencyNumber := '';
                            FrequencyName := '';
                        end;
                    end;

                    trigger OnValidate();
                    begin
                        if FrequencyNumber = '' then
                            FrequencyName := '';
                    end;
                }
                /*field(Descripition; FrequencyName)
                {
                    Caption = 'Descripition';
                    Editable = false;
                }*/
                field(YearZ; Year)
                {
                    Caption = 'YearZ';
                    ApplicationArea = All;
                    ToolTip = 'It Defines Year.';
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
        MaintainanceschedulePart: Record "Maintenance Schedule Part B2B";
        MachinePMRSchedule1: Record "Equipment PMR Schedule B2B";
        Frequency: Record "Frequency  B2B";
        MachinePMRSchedule: Record "Equipment PMR Schedule B2B";
        PMSetup: Record "Plant Maintenance Setup B2B";
        CalendarMgt: Codeunit "Calendar Management";
        DateInterval: DateFormula;
        Days: array[31] of Text[30];
        Year: Integer;
        FrequencyName: Text[50];
        TempDate: Date;
        NoHoliday: Boolean;
        FrequencyNumber: Code[20];
        Text001Lbl: Label 'PMR Schedules created successfully';
        Text002Lbl: Label 'PMR Schedules Not created';
}

