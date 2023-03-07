report 33000907 "Equipment Job Card History B2B"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'BCSTDPLM_Wave2\Reports\Layouts\Equipment Job Card History.rdl';

    Caption = 'Equipment Job Card History';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
        dataitem("PM Job Header"; "PM Job Header B2B")
        {
            DataItemTableView = SORTING("Machine ID") ORDER(Ascending) WHERE(Posted = FILTER(true));
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY(), 0, 4))
            {
            }
            /*column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }*/
            column(USERID; Format(USERID()))
            {
            }
            column(FORMAT_StartDate__________FORMAT_EndDate__; FORMAT(StartDateVar) + '...' + FORMAT(EndDateVar))
            {
            }
            column(PM_Job_Header__Machine_ID_; "Machine ID")
            {
            }
            column(PM_Job_Header__No__; "No.")
            {
            }
            column(PM_Job_Header__Frequency_Name_; "Frequency Name")
            {
            }
            column(PM_Job_Header_Type; Type)
            {
            }
            column(PM_Job_Header__Start_Date_Time_; "Start Date Time")
            {
            }
            column(PMJobLine_Amount; PMJobLine.Amount)
            {
            }
            column(PM_Job_Header__End_Date_Time_; "End Date Time")
            {
            }
            column(PM_Job_Header__Actual_Resource_Cost_; "Actual Resource Cost")
            {
            }
            column(PM_Job_Header__Actual_Spares_Cost_; "Actual Spares Cost")
            {
            }
            column(G_L_RegisterCaption; G_L_RegisterCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Posting_Dates_FiltersCaption; Posting_Dates_FiltersCaptionLbl)
            {
            }
            column(PM_Job_Header__Machine_ID_Caption; FIELDCAPTION("Machine ID"))
            {
            }
            column(Total_CostCaption; Total_CostCaptionLbl)
            {
            }
            column(PM_Job_Header__Start_Date_Time_Caption; FIELDCAPTION("Start Date Time"))
            {
            }
            column(PM_Job_Header_TypeCaption; FIELDCAPTION(Type))
            {
            }
            column(FrequencyCaption; FrequencyCaptionLbl)
            {
            }
            column(PM_Job_Header__No__Caption; FIELDCAPTION("No."))
            {
            }
            column(PM_Job_Header__End_Date_Time_Caption; FIELDCAPTION("End Date Time"))
            {
            }
            column(Resource_CostCaption; Resource_CostCaptionLbl)
            {
            }
            column(Spares_CostCaption; Spares_CostCaptionLbl)
            {
            }
            column(MachineNameCaption; MacchineNameCaptionLbl)
            {
            }
            column(MachineName_PMJobHeader; "PM Job Header"."Machine Name")
            {
            }
            dataitem("Work Sheet"; "Work Sheet B2B")
            {
                DataItemLink = "Job Card No." = FIELD("No."), "Machine ID" = FIELD("Machine ID");
                DataItemTableView = SORTING("Job Card No.", "Machine ID", "Line No.") ORDER(Ascending);
                column(Work_Sheet__Line_Type_; "Line Type")
                {
                }
                column(Work_Sheet__I_R_Code_; "I/R Code")
                {
                }
                column(Work_Sheet__I_R_Description_; "I/R Description")
                {
                }
                column(Work_Sheet__Time_Required_; "Time Required")
                {
                }
                column(Work_Sheet_Quantity; Quantity)
                {
                }
                column(Work_Sheet_UOM; UOM)
                {
                }
                column(Work_Sheet__Unit_Cost_; "Unit Cost")
                {
                }
                column(Work_Sheet_Amount; Amount)
                {
                }
                column(Work_Sheet__Line_Type_Caption; FIELDCAPTION("Line Type"))
                {
                }
                column(CodeCaption; CodeCaptionLbl)
                {
                }
                column(DescriptionCaption; DescriptionCaptionLbl)
                {
                }
                column(Work_Sheet__Unit_Cost_Caption; FIELDCAPTION("Unit Cost"))
                {
                }
                column(Work_Sheet_AmountCaption; FIELDCAPTION(Amount))
                {
                }
                column(Work_Sheet_UOMCaption; FIELDCAPTION(UOM))
                {
                }
                column(TimeCaption; TimeCaptionLbl)
                {
                }
                column(Work_Sheet_QuantityCaption; FIELDCAPTION(Quantity))
                {
                }
                column(Work_Sheet_Job_Card_No_; "Job Card No.")
                {
                }
                column(Work_Sheet_Machine_ID; "Machine ID")
                {
                }
                column(Work_Sheet_Line_No_; "Line No.")
                {
                }
            }

            trigger OnAfterGetRecord();
            begin
                PMJobLine.RESET();
                PMJobLine.SETRANGE("Job Header No.", "PM Job Header"."No.");
                PMJobLine.SETRANGE("Machine ID", "PM Job Header"."Machine ID");
                if PMJobLine.FINDFIRST() then
                    PMJobLine.CALCFIELDS(Amount);
            end;

            trigger OnPreDataItem();
            begin
                if EquipNoVar <> '' then
                    "PM Job Header".SETRANGE("Machine ID", EquipNovar);
                if (StartDateVar <> 0D) and (EndDateVar <> 0D) then
                    "PM Job Header".SETRANGE("Posted Date", StartDateVar, EndDateVar);
            end;
        }
    }

    requestpage
    {
        Caption = 'Equipment Job Card History';

        layout
        {
            area(content)
            {
                //Caption = 'Options';
                group(options)
                {
                    Caption = 'options';
                    field(EquipNo; EquipNoVar)
                    {
                        Caption = 'Equipment No.';
                        ApplicationArea = All;
                        ToolTip = 'It Defines Equipment No.';

                        trigger OnLookup(var Text: Text): Boolean;
                        begin
                            Equipment.RESET();
                            if PAGE.RUNMODAL(0, Equipment) = ACTION::LookupOK then
                                EquipNoVar := Equipment."No.";
                        end;
                    }
                    group("Period wise")
                    {
                        Caption = 'Period wise';
                        field(StartDate; StartDateVar)
                        {
                            Caption = 'Start Date';
                            ApplicationArea = All;
                            ToolTip = 'It Defines Start date.';
                        }
                        field(EndDate; EndDateVar)
                        {
                            Caption = 'End Date';
                            ApplicationArea = All;
                            ToolTip = 'It Defines End Date.';
                        }
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
        Equipment: Record "Equipment B2B";
        PMJobLine: Record "PM Job Line B2B";
        EquipNoVar: Code[20];
        StartDateVar: Date;
        EndDateVar: Date;
        G_L_RegisterCaptionLbl: Label 'Equipment Maintenance History(Cost) Details';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Posting_Dates_FiltersCaptionLbl: Label 'Posting Dates Filters';
        Total_CostCaptionLbl: Label 'Total Cost';
        FrequencyCaptionLbl: Label 'Frequency';
        Resource_CostCaptionLbl: Label 'Resource Cost';
        Spares_CostCaptionLbl: Label 'Spares Cost';
        CodeCaptionLbl: Label 'Code';
        DescriptionCaptionLbl: Label 'Description';
        TimeCaptionLbl: Label 'Time';
        MacchineNameCaptionLbl: Label 'Machine Name';
}

