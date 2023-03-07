page 33000960 "Check Lists B2B"
{

    Caption = 'Check Lists';
    DelayedInsert = false;
    PageType = List;
    SourceTable = "Check List Header B2B";
    UsageCategory = Administration;
    ApplicationArea = all;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines No.';

                    trigger OnAssistEdit();
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.UPDATE();
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Description.';
                }
            }
            part(Control1102154002; "Check List Subform B2B")
            {
                SubPageLink = "Document No." = FIELD("No.");
                ApplicationArea = ALL;
            }
        }
    }

    actions
    {
    }
}

