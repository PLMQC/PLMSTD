report 33000903 "Work Order Tracking Report B2B"
{

    DefaultLayout = RDLC;
    RDLCLayout = 'BCSTDPLM_Wave2\Reports\Layouts\Work Order Tracking Report.rdl';

    Caption = 'Work Order Tracking Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
        dataitem("PM Job Header"; "PM Job Header B2B")
        {
            RequestFilterFields = "Failure Code";
            column(PM_Job_Header__No__; "No.")
            {
            }
            column(PM_Job_Header__Machine_ID_; "Machine ID")
            {
            }
            column(PM_Job_Header__Machine_Name_; "Machine Name")
            {
            }
            column(PM_Job_Header__Failure_Code_; "Failure Code")
            {
            }
            column(FailureDescription_PMJobHeader; "PM Job Header"."Failure Description")
            {
            }
            column(Work_Order_TrackingCaption; Work_Order_TrackingCaptionLbl)
            {
            }
            column(PM_Job_Header__No__Caption; FIELDCAPTION("No."))
            {
            }
            column(PM_Job_Header__Machine_ID_Caption; FIELDCAPTION("Machine ID"))
            {
            }
            column(PM_Job_Header__Machine_Name_Caption; FIELDCAPTION("Machine Name"))
            {
            }
            column(PM_Job_Header__Failure_Code_Caption; FIELDCAPTION("Failure Code"))
            {
            }

            trigger OnPreDataItem();
            begin
                if Global = '' then
                    "PM Job Header".Posted := true
                else begin
                    "PM Job Header".Posted := true;
                    "PM Job Header".SETRANGE("PM Job Header"."Failure Code", "PM Job Header".GETFILTER("PM Job Header"."Failure Code"));
                end;
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

    trigger OnPreReport();
    begin
        Global := "PM Job Header".GetFilter("Failure Code");
    end;

    var
        Global: Text;
        Work_Order_TrackingCaptionLbl: Label 'Work Order Tracking';
}

