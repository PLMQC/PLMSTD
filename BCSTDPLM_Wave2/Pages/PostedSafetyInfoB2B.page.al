page 33000981 "Posted  Safety Info B2B"
{


    Caption = 'Posted  Safety Info';
    Editable = false;
    PageType = List;
    SourceTable = "Job Card  Line Safety Info B2B";
    UsageCategory = Documents;
    ApplicationArea = all;
    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                field("Step No."; Rec."Step No.")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Step No.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Description.';
                }
                field("Safety Equipment"; Rec."Safety Equipment")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Safety Equipment.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Status.';
                }
            }
        }
    }

    actions
    {
    }
}

