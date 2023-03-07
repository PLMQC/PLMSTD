page 33000962 "Check List B2B"
{

    Caption = 'Check List';
    CardPageID = "Check Lists B2B";
    Editable = false;
    PageType = List;
    SourceTable = "Check List Header B2B";
    UsageCategory = Lists;
    ApplicationArea = all;
    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines check list no.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Description.';
                }
            }
        }
    }

    actions
    {
    }
}

