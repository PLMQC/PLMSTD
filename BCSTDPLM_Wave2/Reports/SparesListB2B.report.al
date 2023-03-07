report 33000904 "Spares List B2B"
{

    DefaultLayout = RDLC;
    RDLCLayout = 'BCSTDPLM_Wave2\Reports\Layouts\Spares List.rdl';

    Caption = 'Spares List';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
        dataitem("Maintenance Schedule Part"; "Maintenance Schedule Part B2B")
        {
            DataItemTableView = SORTING("Machine ID", "Next Due Date", "Frequency Name") WHERE("Machine ID" = FILTER(<> ''));
            RequestFilterFields = "Frequency ID";
            column(TODAY; TODAY())
            {
            }
            /*column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }*/
            column(StartDate; StartDate)
            {
            }
            column(Spares_ListCaption; Spares_ListCaptionLbl)
            {
            }
            column(Date_Caption; Date_CaptionLbl)
            {
            }
            column(Page_NoCaption; Page_NoCaptionLbl)
            {
            }
            column(QUANTITYCaption; QUANTITYCaptionLbl)
            {
            }
            column(CodeCaption; CodeCaptionLbl)
            {
            }
            column(DESCRIPTIONCaption; DESCRIPTIONCaptionLbl)
            {
            }
            column(UNIT_COSTCaption; UNIT_COSTCaptionLbl)
            {
            }
            column(AMOUNTCaption; AMOUNTCaptionLbl)
            {
            }
            column(SPIN_No_Caption; SPIN_No_CaptionLbl)
            {
            }
            column(Frequency_NameCaption; Frequency_NameCaptionLbl)
            {
            }
            column(DUE_DATECaption; DUE_DATECaptionLbl)
            {
            }
            column(Maintenance_schedule_Part_No_; "No.")
            {
            }
            column(Maintenance_schedule_Part_Machine_ID; "Machine ID")
            {
            }
            column(Maintenance_schedule_Part_Frequency_Name; "Frequency Name")
            {
            }
            column(Maintenance_schedule_Part_Line_No_; "Line No.")
            {
            }
            column(NextDueDate_MaintenanceschedulePart; "Maintenance Schedule Part"."Next Due Date")
            {
            }
            dataitem("Equipment Schedule Line"; "Equipment Schedule Line B2B")
            {
                DataItemLink = "Schedule Template ID" = FIELD("No.");
                DataItemTableView = SORTING("Schedule Template ID", "Line No.") WHERE("Line Type" = CONST('SPARES'));
                column(Maintenance_schedule_Part___Machine_ID_; "Maintenance Schedule Part"."Machine ID")
                {
                }
                column(Maintenance_schedule_Part___Frequency_Name_; "Maintenance Schedule Part"."Frequency Name")
                {
                }
                column(Equipment_Schedule_Line__I_R_Code_; "I/R Code")
                {
                }
                column(Equipment_Schedule_Line_Quantity; Quantity)
                {
                }
                column(Equipment_Schedule_Line__Unit_Cost_; "Unit Cost")
                {
                }
                column(Equipment_Schedule_Line_Amount; Amount)
                {
                }
                column(Equipment_Schedule_Line__I_R_Description_; "I/R Description")
                {
                }
                column(Maintenance_schedule_Part___Next_Due_Date_; "Maintenance Schedule Part"."Next Due Date")
                {
                }
                column(Equipment_Schedule_Line__I_R_Code__Control1102152066; "I/R Code")
                {
                }
                column(Equipment_Schedule_Line_Quantity_Control1102152067; Quantity)
                {
                }
                column(Equipment_Schedule_Line__Unit_Cost__Control1102152068; "Unit Cost")
                {
                }
                column(Equipment_Schedule_Line_Amount_Control1102152069; Amount)
                {
                }
                column(Equipment_Schedule_Line__I_R_Description__Control1102152070; "I/R Description")
                {
                }
                column(Maintenance_schedule_Part___Next_Due_Date__Control1102152072; "Maintenance Schedule Part"."Next Due Date")
                {
                }
                column(Maintenance_schedule_Part___Frequency_Name__Control1102152074; "Maintenance Schedule Part"."Frequency Name")
                {
                }
                column(Maintenance_schedule_Part___Machine_ID__Control1102152076; "Maintenance Schedule Part"."Machine ID")
                {
                }
                column(Equipment_Schedule_Line_Schedule_Template_ID; "Schedule Template ID")
                {
                }
                column(Equipment_Schedule_Line_Line_No_; "Line No.")
                {
                }
                column(IRCode_EquipmentScheduleLine; "Equipment Schedule Line"."I/R Code")
                {
                }
            }

            trigger OnPreDataItem();
            begin
                if StartDate <> 0D then begin
                    MARKEDONLY(false);
                    if FINDFIRST() then
                        repeat
                            if ("Maintenance Schedule Part"."Next Due Date" >= StartDate) and ("Maintenance Schedule Part"."Next Due Date" <= EndDate) then
                                MARK(true);
                        until NEXT() = 0;
                    MARKEDONLY(true);
                end;
            end;
        }
    }

    requestpage
    {
        Caption = 'Spares List';

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(StartDateVar; StartDate)
                    {
                        Caption = 'Start Date';
                        ApplicationArea = All;
                        ToolTip = 'It Defines Start date.';
                    }
                    field(EndDateVar; EndDate)
                    {
                        Caption = 'End Date';
                        ApplicationArea = All;
                        ToolTip = 'It Defines End date.';
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
        StartDate: Date;
        EndDate: Date;
        Spares_ListCaptionLbl: Label 'SPARES LIST';
        Date_CaptionLbl: Label '"Date "';
        Page_NoCaptionLbl: Label 'Page No';
        QUANTITYCaptionLbl: Label 'Quantity';
        CodeCaptionLbl: Label 'Code';
        DESCRIPTIONCaptionLbl: Label 'Description';
        UNIT_COSTCaptionLbl: Label 'Unit Cost';
        AMOUNTCaptionLbl: Label 'Amount';
        SPIN_No_CaptionLbl: Label 'Machine ID';
        Frequency_NameCaptionLbl: Label 'Frequency Name';
        DUE_DATECaptionLbl: Label 'Due Date';
}

