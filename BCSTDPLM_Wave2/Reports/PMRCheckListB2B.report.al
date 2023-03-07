report 33000912 "PMR Check List B2B"
{

    DefaultLayout = RDLC;
    RDLCLayout = 'BCSTDPLM_Wave2\Reports\Layouts\PMR Check List.rdl';

    Caption = 'Equipment- Weekly&Daily';
    TransactionType = UpdateNoLocks;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
        dataitem(Equipment; "Equipment B2B")
        {
            PrintOnlyIfDetail = false;
            RequestFilterFields = "No.";
            column(CompanyInfo_Name; CompanyInfo.Name)
            {
            }
            /*column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }*/
            column(FrequencyNameLoc; FrequencyNameLoc)
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
            column(Remarks_Caption; RemarksCaptionLbl)
            {
            }
            column(Sl_NOCaption; Sl_NOCaptionLbl)
            {
            }
            column(Signature_of_TechnicianCaption; Signature_of_TechnicianCaptionLbl)
            {
            }
            column(No_Equipment; Equipment."No.")
            {
            }
            column(Name_Equipment; Equipment.Name)
            {
            }
            column(SNo; SNo)
            {
            }
            column(ShortcutDimension1Code_Equipment; Equipment."Shortcut Dimension 1 Code")
            {
            }
            column(Department_Code_Caption; Department_Code_CaptionLbl)
            {
            }
            column(Production_ManagerCaption; Production_ManagerCaptionLbl)
            {
            }
            column(Work_Center_Caption; Work_Center_CaptionLbl)
            {
            }
            column(Date; TODAY())
            {
            }
            column(Date_Caption; DateCaptionLbl)
            {
            }
            column(MachineLocation_Equipment; Equipment."Machine Location")
            {
            }
            dataitem("Check List Line"; "Check List Line B2B")
            {
                column(Description_CheckListLine; "Check List Line".Description)
                {
                }
                column(Frequency_CheckListLine; "Check List Line".Frequency)
                {
                }
                column(TimeInterval_CheckListLine; "Check List Line"."Time Interval")
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
        PREVENTIVE_MAINTENANCE_CHECK_LIST__CaptionLbl: Label 'PREVENTIVE MAINTENANCE CHECK LIST';
        Machine_ID_CaptionLbl: Label 'Machine ID :';
        Name_of_the_Equipment_CaptionLbl: Label 'Name of the Equipment :';
        CheckCaptionLbl: Label 'Check List';
        RemarksCaptionLbl: Label 'Remarks';
        Sl_NOCaptionLbl: Label 'Sl NO';
        Signature_of_TechnicianCaptionLbl: Label 'Signature of Technician';
        Production_ManagerCaptionLbl: Label 'Production Manager';
        Department_Code_CaptionLbl: Label 'Department Code :';
        Work_Center_CaptionLbl: Label 'Work Center :';
        DateCaptionLbl: Label 'Date :';
}

