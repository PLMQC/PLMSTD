page 33000938 "Specification Groups B2B"
{

    Caption = 'Specification Groups';
    PageType = List;
    SourceTable = "Specification Group B2B";
    UsageCategory = Administration;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Specification group code.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Specification Group description.';
                }
            }
        }
    }

    actions
    {
    }
}

