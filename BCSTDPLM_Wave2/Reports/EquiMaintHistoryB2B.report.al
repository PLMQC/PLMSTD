report 33000899 "Equi. Maint.History B2B"
{

    DefaultLayout = RDLC;
    RDLCLayout = 'BCSTDPLM_Wave2\Reports\Layouts\Equipment MaintenanceHistory.rdl';

    Caption = 'Equipment MaintenanceHistory';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
        dataitem("PM Job Header"; "PM Job Header B2B")
        {
            CalcFields = "Actual Resource Cost", "Actual Spares Cost";
            DataItemTableView = SORTING("Machine ID");
            RequestFilterFields = "Machine ID";
            column(PM_Job_Header_MachineID; "Machine ID")
            {
            }
            column(Machine_Maintenance_History_Caption; Machine_Maintenance_History_CaptionLbl)
            {
            }
            column(Total_CostCaption; Total_CostCaptionLbl)
            {
            }
            column(Actual_Resource_CostCaption; Actual_Resource_CostCaptionLbl)
            {
            }
            column(Actual_Spares_CostCaption; Actual_Spares_CostCaptionLbl)
            {
            }
            column(StatusCaption; StatusCaptionLbl)
            {
            }
            column(End_dateCaption; End_dateCaptionLbl)
            {
            }
            column(Start_dateCaption; Start_dateCaptionLbl)
            {
            }
            column(Reported_Date_TimeCaption; Reported_Date_TimeCaptionLbl)
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(Inspection_TypeCaption; Inspection_TypeCaptionLbl)
            {
            }
            column(FrequencyCaption; FrequencyCaptionLbl)
            {
            }
            column(TypeCaption; TypeCaptionLbl)
            {
            }
            column(Job_card_NoCaption; Job_card_NoCaptionLbl)
            {
            }
            column(PM_Job_Header_MachineIDCaption; FIELDCAPTION("Machine ID"))
            {
            }
            column(PM_Job_Header_MachineName; "PM Job Header"."Machine Name")
            {
            }
            column(PM_Job_Header_No_; "No.")
            {
            }
            column(EndDateTime_PMJobHeader; "PM Job Header"."End Date Time")
            {
            }
            column(ActualResourceCost_PMJobHeader; "PM Job Header"."Actual Resource Cost")
            {
            }
            column(Date; DateGVar)
            {
            }
            dataitem("PM Job Line"; "PM Job Line B2B")
            {
                DataItemLink = "Job Header No." = FIELD("No."), "Machine ID" = FIELD("Machine ID");
                DataItemTableView = SORTING("Job Header No.", "Machine ID", "Line No.");
                column(PM_Job_Header___Total_Cost_; "PM Job Header"."Total Cost")
                {
                }
                column(PM_Job_Header___Actual_Resource_Cost_; "PM Job Header"."Actual Resource Cost")
                {
                }
                column(PM_Job_Header___Actual_Spares_Cost_; "PM Job Header"."Actual Spares Cost")
                {
                }
                column(LocStatus; LocStatus)
                {
                }
                column(PM_Job_Header___Posted_Date_; "PM Job Header"."Posted Date")
                {
                }
                column(PM_Job_Header___Created_Date_; "PM Job Header"."Created Date")
                {
                }
                column(PM_Job_Header___Start_Date_Time_; "PM Job Header"."Start Date Time")
                {
                }
                column(PM_Job_Header___Created_Date__Control1102154015; "PM Job Header"."Created Date")
                {
                }
                column(PM_Job_Line__PM_Job_Line__Description; "PM Job Line".Description)
                {
                }
                column(PM_Job_Line__PM_Job_Line__InspTypeName; "PM Job Line"."Maintenace Type Name")
                {
                }
                column(PM_Job_Header__FrequencyName; "PM Job Header"."Frequency Name")
                {
                }
                column(PM_Job_Header__Type; "PM Job Header".Type)
                {
                }
                column(PM_Job_Header___No__; "PM Job Header"."No.")
                {
                }
                column(PM_Job_Line_Job_Header_No_; "Job Header No.")
                {
                }
                column(PM_Job_Line_Machine_ID; "Machine ID")
                {
                }
                column(PM_Job_Line_Line_No_; "Line No.")
                {
                }
            }

            trigger OnAfterGetRecord();
            begin
                if "PM Job Header".Posted then
                    LocStatus := LocStatus::Closed
                else
                    LocStatus := LocStatus::Open;

                if "PM Job Header".Type = "PM Job Header".Type::PMR then
                    DateGVar := 0D
                else
                    DateGVar := "PM Job Header"."Created Date";
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        LocStatus: Option Closed,Open;
        Machine_Maintenance_History_CaptionLbl: Label '"Machine Maintenance History "';
        Total_CostCaptionLbl: Label 'Total Cost';
        Actual_Resource_CostCaptionLbl: Label 'Actual Resource Cost';
        Actual_Spares_CostCaptionLbl: Label 'Actual Spares Cost';
        StatusCaptionLbl: Label 'Status';
        End_dateCaptionLbl: Label 'End date';
        Start_dateCaptionLbl: Label 'Start date';
        Reported_Date_TimeCaptionLbl: Label 'Reported Date&Time';
        DescriptionCaptionLbl: Label 'Description';
        Inspection_TypeCaptionLbl: Label 'Inspection Type';
        FrequencyCaptionLbl: Label 'Frequency';
        TypeCaptionLbl: Label 'Type';
        Job_card_NoCaptionLbl: Label 'Job card No';
        DateGVar: Date;
}

