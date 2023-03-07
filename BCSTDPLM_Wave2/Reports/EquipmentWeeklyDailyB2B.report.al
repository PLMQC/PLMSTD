report 33000901 "Equipment- Weekly&Daily B2B"
{

    DefaultLayout = RDLC;
    RDLCLayout = 'BCSTDPLM_Wave2\Reports\Layouts\Equipment- Weekly&Daily.rdl';

    Caption = 'Equipment- Weekly&Daily';
    TransactionType = UpdateNoLocks;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
        dataitem("PM Job Header"; "PM Job Header B2B")
        {
            RequestFilterFields = "Machine ID";
            column(CompanyInfo_Name; CompanyInfo.Name)
            {
            }
            /*column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }*/
            column(FrequencyNameLoc; FrequencyNameLoc)
            {
            }
            column(PM_Job_Header__PM_Job_Header___Machine_Name_; "PM Job Header"."Machine Name")
            {
            }
            column(PM_Job_Header__PM_Job_Header___Machine_ID_; "PM Job Header"."Machine ID")
            {
            }
            column(Page_Caption; Page_CaptionLbl)
            {
            }
            column(Ref__No__Caption; Ref__No__CaptionLbl)
            {
            }
            column(PREVENTIVE_MAINTENANCE_CHECK_LIST__Caption; PREVENTIVE_MAINTENANCE_CHECK_LIST__CaptionLbl)
            {
            }
            column(Machine_ID_Caption; Machine_ID_CaptionLbl)
            {
            }
            column(Name_of_the_Equipment_Caption; Name_of_the_Equipment_CaptionLbl)
            {
            }
            column(CheckCaption; CheckCaptionLbl)
            {
            }
            column(ResultCaption; ResultCaptionLbl)
            {
            }
            column(Sl_NOCaption; Sl_NOCaptionLbl)
            {
            }
            column(Signature_of_TechnicianCaption; Signature_of_TechnicianCaptionLbl)
            {
            }
            column(Production_ManagerCaption; Production_ManagerCaptionLbl)
            {
            }
            column(PM_Job_Header_No_; "No.")
            {
            }
            dataitem("PM Job Line"; "PM Job Line B2B")
            {
                DataItemLink = "Job Header No." = FIELD("No.");
                column(SNo; SNo)
                {
                }
                column(PM_Job_Line__PM_Job_Line__Description; "PM Job Line".Description)
                {
                }
                column(PM_Job_Line__PM_Job_Line___Frequency_Name_; "PM Job Line"."Frequency Name")
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
                    SNo += 1;
                end;

                trigger OnPreDataItem();
                begin
                    SNo := 0;
                end;
            }

            trigger OnPreDataItem();
            begin
                CompanyInfo.GET();
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
        CompanyInfo: Record "Company Information";
        SNo: Integer;
        FrequencyNameLoc: Text[50];
        Page_CaptionLbl: Label 'Page:';
        Ref__No__CaptionLbl: Label 'Ref. No:-';
        PREVENTIVE_MAINTENANCE_CHECK_LIST__CaptionLbl: Label 'PREVENTIVE MAINTENANCE CHECK LIST -';
        Machine_ID_CaptionLbl: Label 'Machine ID:';
        Name_of_the_Equipment_CaptionLbl: Label 'Name of the Equipment:';
        CheckCaptionLbl: Label 'Check';
        ResultCaptionLbl: Label 'Result';
        Sl_NOCaptionLbl: Label 'Sl NO';
        Signature_of_TechnicianCaptionLbl: Label 'Signature of Technician';
        Production_ManagerCaptionLbl: Label 'Production Manager';
}

