page 33000927 "Job Card Procedure List B2B"
{

    Caption = 'Posted Job Card Procedure List';
    Editable = false;
    PageType = List;
    SourceTable = "Job Card  Line Procedure B2B";
    UsageCategory = History;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("Machine ID"; Rec."Machine ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Machine ID.';
                    Caption = 'SPIN No.';
                }
                field("Machine Name"; Rec."Machine Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Machine Name';
                }
                field("Step No."; Rec."Step No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines step No';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Description.';
                }
                field("Perfomed By"; Rec."Perfomed By")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Performaed By';
                }
                field("Special Tools"; Rec."Special Tools")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Special tools.';
                }
            }
        }
    }

    actions
    {
    }
}

