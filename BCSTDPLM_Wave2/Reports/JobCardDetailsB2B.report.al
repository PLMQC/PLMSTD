report 33000906 "Job Card Details B2B"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'BCSTDPLM_Wave2\Reports\Layouts\Job Card Details.rdl';

    Caption = 'Job Card Details';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
        dataitem("PM Job Header"; "PM Job Header B2B")
        {
            RequestFilterFields = "No.", "Machine ID";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY(), 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME())
            {
            }
            /*column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }*/
            column(USERID; Format(USERID()))
            {
            }
            column(PM_Job_Header__Created_By_; "Created By")
            {
            }
            column(PM_Job_Header__Created_Date_; "Created Date")
            {
            }
            column(PersonResponsibleCaption; PersonResponsibleCaptionLbl)
            {
            }
            column(PM_Job_Header__Complaint_No__; "Complaint No.")
            {
            }
            column(PM_Job_Header__Machine_Name_; "Machine Name")
            {
            }
            column(PM_Job_Header__Frequency_Name_; "Frequency Name")
            {
            }
            column(PM_Job_Header_Type; Type)
            {
            }
            column(PM_Job_Header__No__; "No.")
            {
            }
            column(PM_Job_Header__Machine_ID_; "Machine ID")
            {
            }
            column(Job_Card_DetailsCaption; Job_Card_DetailsCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(PM_Job_Header__Created_By_Caption; FIELDCAPTION("Created By"))
            {
            }
            column(PM_Job_Header__Created_Date_Caption; FIELDCAPTION("Created Date"))
            {
            }
            column(PM_Job_Header__Complaint_No__Caption; FIELDCAPTION("Complaint No."))
            {
            }
            column(PM_Job_Header__Machine_Name_Caption; FIELDCAPTION("Machine Name"))
            {
            }
            column(PM_Job_Header__Frequency_Name_Caption; FIELDCAPTION("Frequency Name"))
            {
            }
            column(PM_Job_Header_TypeCaption; FIELDCAPTION(Type))
            {
            }
            column(PM_Job_Header__No__Caption; FIELDCAPTION("No."))
            {
            }
            column(PM_Job_Header__Machine_ID_Caption; FIELDCAPTION("Machine ID"))
            {
            }
            column(Resource_NameCaption; Resource_NameCaptionLbl)
            {
            }
            column(Start_Date_TimeCaption; Start_Date_TimeCaptionLbl)
            {
            }
            column(DepartmentCaption; DepartmentCaptionLbl)
            {
            }
            column(ProjectCodeCaption; ProjectCodeCaptionLbl)
            {
            }
            column(machineTypeCaption; machineTypeCaptionLbl)
            {
            }
            column(FrequencyCaption; FrequencyCaptionLbl)
            {
            }
            column(StartTimeCaption; StartTimeCaptionLbl)
            {
            }
            column(EndTimeCaption; EndTimeCaptionLbl)
            {
            }
            column(MaintenanceType_PMJobHeader; "PM Job Header"."Maintenance Type")
            {
            }
            column(DepartmentCode_PMJobHeader; "PM Job Header"."Shortcut Dimension 1 Code")
            {
            }
            column(ProjectCode_PMJobHeader; "PM Job Header"."Shortcut Dimension 2 Code")
            {
            }
            column(FrequencyName_PMJobHeader; "PM Job Header"."Frequency Name")
            {
            }
            column(EndDateTime_PMJobHeader; "PM Job Header"."End Date Time")
            {
            }
            column(StartDateTime_PMJobHeader; "PM Job Header"."Start Date Time")
            {
            }
            column(LineTypeCaption; LineTypeCaptionLbl)
            {
            }
            column(NoCaption; NoCaptionLbl)
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(UOMCaption; UOMCaptionLbl)
            {
            }
            column(UnitcostCaption; UnitcostCaptionLbl)
            {
            }
            column(AmountCaption; AmountCaptionLbl)
            {
            }
            column(SNoCaption; SNoCaptionLbl)
            {
            }
            column(WorkCenterCaption; WorkCenterCaptionLbl)
            {
            }
            column(ToolsCaption; ToolsCaptionLbl)
            {
            }
            column(PerformedByCaption; PerformedByCaptionLbl)
            {
            }
            column(ProcedureCaption; ProcedureCaptionLbl)
            {
            }
            column(ActualsCaption; ActualsCaptionLbl)
            {
            }
            column(PreparedByCaption; PreparedByCaptionLbl)
            {
            }
            column(MaintananceEnggCaption; MaintananceEnggCaptionLbl)
            {
            }
            column(DepartmentHeadCaption; DepartmentHeadCaptionLbl)
            {
            }
            column(Resource_PMJobHeader; "PM Job Header".Resource)
            {
            }
            column(Spares_and_ConsumablesCaption; Spares_and_ConsumablesCaptionLbl)
            {
            }
            column(QuantityCaption; QuantityCaptionLbl)
            {
            }
            dataitem("PM Job Operation Particulars"; "PM Job OP Particulars B2B")
            {
                DataItemLink = "Job Card No." = FIELD("No.");
                DataItemTableView = SORTING(ID, "ScheduleTemplate ID", "Line No.") ORDER(Ascending);
                column(LineType_PMJobOperationParticulars; "PM Job Operation Particulars"."Line Type")
                {
                }
                column(PM_Job_Operation_Particulars__I_R_Code_; "I/R Code")
                {
                }
                column(PM_Job_Operation_Particulars__I_R_Description_; "I/R Description")
                {
                }
                column(PM_Job_Operation_Particulars__I_R_Code_Caption; FIELDCAPTION("I/R Code"))
                {
                }
                column(PM_Job_Operation_Particulars__I_R_Description_Caption; FIELDCAPTION("I/R Description"))
                {
                }
                column(PM_Job_Operation_Particulars_ID; ID)
                {
                }
                column(Amount_PMJobOperationParticulars; "PM Job Operation Particulars".Amount)
                {
                }
                column(PM_Job_Operation_Particulars_ScheduleTemplate_ID; "ScheduleTemplate ID")
                {
                }
                column(PM_Job_Operation_Particulars_Line_No_; "Line No.")
                {
                }
                column(PM_Job_Operation_Particulars_Job_Card_No_; "Job Card No.")
                {
                }
                column(UnitCost_PMJobOperationParticulars; "PM Job Operation Particulars"."Unit Cost")
                {
                }
                column(UOM_PMJobOperationParticulars; "PM Job Operation Particulars".UOM)
                {
                }
                column(Quantity_PMJobOperationParticulars; "PM Job Operation Particulars".Quantity)
                {
                }
            }
            dataitem("Work Sheet"; "Work Sheet B2B")
            {
                DataItemLink = "Job Card No." = FIELD("No.");
                DataItemTableView = SORTING("Job Card No.", "Machine ID", "Line No.") ORDER(Ascending);
                column(IRCode_WorkSheet; "Work Sheet"."I/R Code")
                {
                }
                column(LineType_WorkSheet; "Work Sheet"."Line Type")
                {
                }
                column(Quantity_WorkSheet; "Work Sheet".Quantity)
                {
                }
                column(UOM_WorkSheet; "Work Sheet".UOM)
                {
                }
                column(Amount_WorkSheet; "Work Sheet".Amount)
                {
                }
                column(UnitCost_WorkSheet; "Work Sheet"."Unit Cost")
                {
                }
                column(IRDescription_WorkSheet; "Work Sheet"."I/R Description")
                {
                }
                column(JobCardNo_WorkSheet; "Work Sheet"."Job Card No.")
                {
                }
                column(LineNo_WorkSheet; "Work Sheet"."Line No.")
                {
                }
                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    Message('%1', "Line No.");
                end;
            }
            dataitem("Job Card  Line Procedure"; "Job Card  Line Procedure B2B")
            {
                DataItemLink = "Job Card No." = FIELD("No.");
                DataItemTableView = SORTING("Job Card No.", "Machine ID", "Job Card  Line No.", "Step No.") ORDER(Ascending);
                column(Job_Card__Line_Procedure__Step_No__; "Step No.")
                {
                }
                column(Job_Card__Line_Procedure_Description; Description)
                {
                }
                column(Job_Card__Line_Procedure__Special_Tools_; "Special Tools")
                {
                }
                column(Job_Card__Line_Procedure_Status; Status)
                {
                }
                column(Job_Card__Line_Procedure__Step_No__Caption; FIELDCAPTION("Step No."))
                {
                }
                column(Job_Card__Line_Procedure_DescriptionCaption; FIELDCAPTION(Description))
                {
                }
                column(Job_Card__Line_Procedure__Special_Tools_Caption; FIELDCAPTION("Special Tools"))
                {
                }
                column(Job_Card__Line_Procedure_StatusCaption; FIELDCAPTION(Status))
                {
                }
                column(Job_Card__Line_Procedure_Job_Card_No_; "Job Card No.")
                {
                }
                column(Job_Card__Line_Procedure_Machine_ID; "Machine ID")
                {
                }
                column(Job_Card__Line_Procedure_Job_Card__Line_No_; "Job Card  Line No.")
                {
                }
                column(WorkCenter_JobCardLineProcedure; "Job Card  Line Procedure"."Work Center")
                {
                }
                column(PerfomedBy_JobCardLineProcedure; "Job Card  Line Procedure"."Perfomed By")
                {
                }
            }
            dataitem("Equipment Check List"; "Equipment Check List B2B")
            {
                DataItemLink = "Machine ID" = FIELD("Machine ID");
                DataItemTableView = SORTING("Machine ID", Code) ORDER(Ascending);
                column(Equipment_Check_List_Description; Description)
                {
                }
                column(Equipment_Check_List_Status; Status)
                {
                }
                column(Equipment_Check_List_DescriptionCaption; FIELDCAPTION(Description))
                {
                }
                column(Equipment_Check_List_StatusCaption; FIELDCAPTION(Status))
                {
                }
                column(Check_ListCaption; Check_ListCaptionLbl)
                {
                }
                column(Equipment_Check_List_Machine_ID; "Machine ID")
                {
                }
                column(Equipment_Check_List_Code; Code)
                {
                }
            }
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
        Job_Card_DetailsCaptionLbl: Label 'Job Card Details';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Resource_NameCaptionLbl: Label 'Resource Name';
        Start_Date_TimeCaptionLbl: Label 'Start Date Time';
        QuantityCaptionLbl: Label 'Quantity';
        Spares_and_ConsumablesCaptionLbl: Label 'Planned Worksheet';
        ProcedureCaptionLbl: Label 'Procedure';
        Check_ListCaptionLbl: Label 'Check List';
        DepartmentCaptionLbl: Label 'Department';
        ProjectCodeCaptionLbl: Label 'Project Code';
        machineTypeCaptionLbl: Label 'Machine Type';
        FrequencyCaptionLbl: Label 'Frequency';
        StartTimeCaptionLbl: Label 'Start Time';
        EndTimeCaptionLbl: Label 'End date Time';
        LineTypeCaptionLbl: Label 'Line Type';
        NoCaptionLbl: Label 'No.';
        DescriptionCaptionLbl: Label 'Description';
        UOMCaptionLbl: Label 'UOM';
        UnitcostCaptionLbl: Label 'Unit Cost';
        AmountCaptionLbl: Label 'Amount';
        SNoCaptionLbl: Label 'Step No.';
        WorkCenterCaptionLbl: Label 'Work Center';
        ToolsCaptionLbl: Label 'Tools';
        PerformedByCaptionLbl: Label 'Performed By';
        ActualsCaptionLbl: Label 'Actuals';
        PreparedByCaptionLbl: Label 'Prepared By';
        MaintananceEnggCaptionLbl: Label 'Maintanance Engg';
        DepartmentHeadCaptionLbl: Label 'Department Head';
        PersonResponsibleCaptionLbl: Label 'Person Responsible';
}

