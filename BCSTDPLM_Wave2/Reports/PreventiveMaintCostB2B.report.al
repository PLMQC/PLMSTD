report 33000898 "Preventive Maint. Cost B2B"
{

    DefaultLayout = RDLC;
    RDLCLayout = 'BCSTDPLM_Wave2\Reports\Layouts\Preventive Maintenance Cost.rdl';

    Caption = 'Preventive Maintenace Cost';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
        dataitem("PM Job Header"; "PM Job Header B2B")
        {
            CalcFields = "Actual Resource Cost", "Actual Spares Cost";
            DataItemTableView = SORTING("Machine ID") WHERE(Type = CONST(PMR), Posted = CONST(true));
            RequestFilterFields = "Machine ID";
            column(PM_Job_Header_MachineID; "Machine ID")
            {
            }
            column(MachineName_PMJobHeader; "PM Job Header"."Machine Name")
            {
            }
            column(Preventive_Maintenance_Cost_Caption; Preventive_Maintenance_Cost_CaptionLbl)
            {
            }
            column(PM_Job_Header_MachineIDCaption; FIELDCAPTION("Machine ID"))
            {
            }
            column(Machine_NameCaption; Machine_NameCaptionLbl)
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
            column(TimeCaption; TimeCaptionLbl)
            {
            }
            column(Inspection_TypeCaption; Inspection_TypeCaptionLbl)
            {
            }
            column(FrequencyCaption; FrequencyCaptionLbl)
            {
            }
            column(Job_card_NoCaption; Job_card_NoCaptionLbl)
            {
            }
            column(TotalMinutes_PMJobHeader; "PM Job Header"."Total Minutes")
            {
            }
            column(PM_Job_Header_No_; "No.")
            {
            }
            dataitem("PM Job Line"; "PM Job Line B2B")
            {
                DataItemLink = "Job Header No." = FIELD("No.");
                column(PM_Job_Header___Actual_Resource_Cost_; "PM Job Header"."Actual Resource Cost")
                {
                }
                column(PM_Job_Header___Actual_Spares_Cost_; "PM Job Header"."Actual Spares Cost")
                {
                }
                column(Staus; Staus)
                {
                }
                column(PM_Job_Header___Time_Duration_; "PM Job Header"."Time Duration")
                {
                }
                column(PM_Job_Line__PM_Job_Line__InspTypeName; "PM Job Line"."Maintenace Type Name")
                {
                }
                column(PM_Job_Header__FrequencyName; "PM Job Header"."Frequency Name")
                {
                }
                column(PM_Job_Header___No__; "PM Job Header"."No.")
                {
                }
                column(PM_Job_Header___Total_Cost_; "PM Job Header"."Total Cost")
                {
                }
                column(PM_Job_Header___Created_Date_; "PM Job Header"."Created Date")
                {
                }
                column(PM_Job_Header___Posted_Date_; "PM Job Header"."Posted Date")
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
                column(Total_Caption; Total_CaptionLbl)
                {
                }

                trigger OnAfterGetRecord();
                begin
                    Staus := Staus::Closed;
                end;
            }
        }
    }

    requestpage
    {
        Caption = 'Preventive Maintenance Cost';

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
        Staus: Option Closed,Open;
        Preventive_Maintenance_Cost_CaptionLbl: Label '"Preventive Maintenance Cost "';
        Total_CostCaptionLbl: Label 'Total Cost';
        Actual_Resource_CostCaptionLbl: Label 'Actual Resource Cost';
        Actual_Spares_CostCaptionLbl: Label 'Actual Spares Cost';
        StatusCaptionLbl: Label 'Status';
        End_dateCaptionLbl: Label 'End date';
        Start_dateCaptionLbl: Label 'Start date';
        TimeCaptionLbl: Label 'Time In Mns';
        Inspection_TypeCaptionLbl: Label 'Inspection Type';
        FrequencyCaptionLbl: Label 'Frequency';
        Job_card_NoCaptionLbl: Label 'Job card No';
        Machine_NameCaptionLbl: Label 'Machine Name';
        Total_CaptionLbl: Label 'Total';
}

