page 33000980 "Job Card Line Safety Info B2B"
{

    Caption = 'Job Card Line Safety Info';
    PageType = List;
    SourceTable = "Job Card  Line Safety Info B2B";
    UsageCategory = Documents;
    ApplicationArea = All;
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
                    OptionCaption = '" , No,Finished,Not Applicable,Additional"';
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

