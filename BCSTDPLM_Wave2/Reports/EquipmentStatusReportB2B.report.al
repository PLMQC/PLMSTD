report 33000905 "Equipment Status Report B2B"
{

    DefaultLayout = RDLC;
    RDLCLayout = 'BCSTDPLM_Wave2\Reports\Layouts\Equipment Status Report.rdl';

    Caption = 'Equipment Status Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
        dataitem(Equipment; "Equipment B2B")
        {
            PrintOnlyIfDetail = false;
            RequestFilterFields = "No.";
            column(TODAY; TODAY())
            {
            }
            /*column(CurrReport_PAGENO; CurrReport.PageNo())
            {
            }*/
            column(Equipment__No__; "No.")
            {
            }
            column(Equipment_Name; Name)
            {
            }
            column(Equipment__Location_Name_; "Location Name")
            {
            }
            column(Equipment__Equipment_Status_; "Equipment Status")
            {
            }
            column(Date_Caption; Date_CaptionLbl)
            {
            }
            column(Page_NoCaption; Page_NoCaptionLbl)
            {
            }
            column(Plant_IDCaption; Plant_IDCaptionLbl)
            {
            }
            column(Equipment__Equipment_Status_Caption; FIELDCAPTION("Equipment Status"))
            {
            }
            column(Equipment_NameCaption; FIELDCAPTION(Name))
            {
            }
            column(Equipment__No__Caption; FIELDCAPTION("No."))
            {
            }

            trigger OnAfterGetRecord();
            begin
                if Equipment."Equipment Status" = Equipment."Equipment Status"::" " then
                    CurrReport.SKIP();
            end;

            trigger OnPreDataItem();
            begin
                Equipment.RESET();
                if Equipment.FINDFIRST() then
                    repeat
                        if not Equipment."Is In Use" then begin
                            Equipment."Equipment Status" := Equipment."Equipment Status"::" ";
                            Equipment.MODIFY();
                        end else
                            if Equipment."Is In Use" then begin
                                PmJObHeaderRec.RESET();
                                PmJObHeaderRec.SETRANGE("Machine ID", Equipment."No.");
                                PmJObHeaderRec.SETRANGE(Type, PmJObHeaderRec.Type::PMR);
                                PmJObHeaderRec.SETRANGE(Posted, false);
                                if PmJObHeaderRec.FINDFIRST() then begin
                                    Equipment."Equipment Status" := Equipment."Equipment Status"::"Under Preventive";
                                    Equipment.MODIFY();
                                end else begin
                                    PmJObHeaderRec.RESET();
                                    PmJObHeaderRec.SETRANGE("Machine ID", Equipment."No.");
                                    PmJObHeaderRec.SETRANGE(Type, PmJObHeaderRec.Type::BreakDown);
                                    PmJObHeaderRec.SETRANGE(Posted, false);
                                    if PmJObHeaderRec.FINDFIRST() then begin
                                        Equipment."Equipment Status" := Equipment."Equipment Status"::"Under Breakdown";
                                        Equipment.MODIFY();
                                    end else begin
                                        PmJObHeaderRec.RESET();
                                        PmJObHeaderRec.SETRANGE("Machine ID", Equipment."No.");
                                        PmJObHeaderRec.SETRANGE(Type, PmJObHeaderRec.Type::Others);
                                        PmJObHeaderRec.SETRANGE(Type, PmJObHeaderRec.Type::Predictive);
                                        PmJObHeaderRec.SETRANGE(Posted, false);
                                        if PmJObHeaderRec.FINDFIRST() then begin
                                            Equipment."Equipment Status" := Equipment."Equipment Status"::"Under Others";
                                            Equipment.MODIFY();
                                        end else begin
                                            BreakDownRec.SETRANGE("Machine No.", Equipment."No.");
                                            BreakDownRec.SETRANGE(Status, BreakDownRec.Status::Open);
                                            BreakDownRec.SETRANGE(Posted, false);
                                            if BreakDownRec.FINDFIRST() then begin
                                                Equipment."Equipment Status" := Equipment."Equipment Status"::"Under Complaint";
                                                Equipment.MODIFY();
                                            end else begin
                                                Equipment2.SETRANGE("No.", "No.");
                                                if Equipment2.FINDFIRST() then begin
                                                    Equipment."Equipment Status" := Equipment."Equipment Status"::Running;
                                                    Equipment.MODIFY();
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                    until Equipment.NEXT() = 0;
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
        PmJObHeaderRec: Record "PM Job Header B2B";
        BreakDownRec: Record "Breakdown Records B2B";
        Equipment2: Record "Equipment B2B";
        Date_CaptionLbl: Label '"Date "';
        Page_NoCaptionLbl: Label 'Page No';
        Plant_IDCaptionLbl: Label 'Plant ID';
}

