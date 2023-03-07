report 33000900 "EquipmentWise BreakDown B2B"
{

    DefaultLayout = RDLC;
    RDLCLayout = 'BCSTDPLM_Wave2\Reports\Layouts\EquipmentWise BreakDown.rdl';

    Caption = 'EquipmentWise BreakDown';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
        dataitem("PM Job Header"; "PM Job Header B2B")
        {
            CalcFields = "Actual Resource Cost", "Actual Spares Cost";
            DataItemTableView = SORTING("Machine ID") WHERE(Type = FILTER(<> PMR));
            RequestFilterFields = "Machine ID";
            column(PM_Job_Header_MachineID; "Machine ID")
            {
            }
            column(Machine_Wise_BreakDown_AnalysisCaption; Machine_Wise_BreakDown_AnalysisCaptionLbl)
            {
            }
            column(Job_card_NoCaption; Job_card_NoCaptionLbl)
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(Reported_Date_TimeCaption; Reported_Date_TimeCaptionLbl)
            {
            }
            column(Start_dateCaption; Start_dateCaptionLbl)
            {
            }
            column(End_dateCaption; End_dateCaptionLbl)
            {
            }
            column(StatusCaption; StatusCaptionLbl)
            {
            }
            column(Actual_Spares_CostCaption; Actual_Spares_CostCaptionLbl)
            {
            }
            column(Actual_Resource_CostCaption; Actual_Resource_CostCaptionLbl)
            {
            }
            column(Total_CostCaption; Total_CostCaptionLbl)
            {
            }
            column(Failure_CodeCaption; Failure_CodeCaptionLbl)
            {
            }
            column(Failure_DescriptionCaption; Failure_DescriptionCaptionLbl)
            {
            }
            column(Machine_IDCaption; Machine_IDCaptionLbl)
            {
            }
            column(PM_Job_Header_No_; "No.")
            {
            }
            column(Machine_NameCaption; Machine_NameCaptionLbl)
            {
            }
            column(MachineName_PMJobHeader; "PM Job Header"."Machine Name")
            {
            }
            dataitem("PM Job Line"; "PM Job Line B2B")
            {
                DataItemLink = "Job Header No." = FIELD("No.");
                DataItemTableView = SORTING("Job Header No.", "Machine ID", "Line No.");
                column(PM_Job_Header___Total_Cost_; "PM Job Header"."Total Cost")
                {
                }
                column(PM_Job_Header___Actual_Spares_Cost_; "PM Job Header"."Actual Spares Cost")
                {
                }
                column(PM_Job_Line_Status; Status)
                {
                }
                column(PM_Job_Header___Created_Date_; "PM Job Header"."Created Date")
                {
                }
                column(PM_Job_Header___Start_Date_Time_; "PM Job Header"."Start Date Time")
                {
                }
                column(PM_Job_Line__PM_Job_Line__Description; "PM Job Line".Description)
                {
                }
                column(PM_Job_Header___Created_Date__Control1102154083; "PM Job Header"."Created Date")
                {
                }
                column(PM_Job_Header___Posted_Date_; "PM Job Header"."Posted Date")
                {
                }
                column(PM_Job_Header___Actual_Resource_Cost_; "PM Job Header"."Actual Resource Cost")
                {
                }
                column(PM_Job_Header___No__; "PM Job Header"."No.")
                {
                }
                column(PM_Job_Header___Failure_Code_; "PM Job Header"."Failure Code")
                {
                }
                column(PM_Job_Header___Failure_Description_; "PM Job Header"."Failure Description")
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

                trigger OnAfterGetRecord();
                begin
                    Index += 1;
                end;

                trigger OnPreDataItem();
                begin
                    Index := 0;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                if "PM Job Header".Posted then
                    Status := Status::Released
                else
                    Status := Status::Open;
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
        Index: Integer;
        Machine_Wise_BreakDown_AnalysisCaptionLbl: Label 'Machine Wise BreakDown Analysis';
        Job_card_NoCaptionLbl: Label 'Job card No';
        DescriptionCaptionLbl: Label 'Description';
        Reported_Date_TimeCaptionLbl: Label 'Reported Date&Time';
        Start_dateCaptionLbl: Label 'Start date';
        End_dateCaptionLbl: Label 'End date';
        StatusCaptionLbl: Label 'Status';
        Actual_Spares_CostCaptionLbl: Label 'Actual Spares Cost';
        Actual_Resource_CostCaptionLbl: Label 'Actual Resource Cost';
        Total_CostCaptionLbl: Label 'Total Cost';
        Failure_CodeCaptionLbl: Label 'Failure Code';
        Failure_DescriptionCaptionLbl: Label 'Failure Description';
        Machine_IDCaptionLbl: Label 'Machine ID';
        Machine_NameCaptionLbl: Label 'Machine Name';
}

