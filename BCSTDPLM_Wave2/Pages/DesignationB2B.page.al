page 33000964 "Designation B2B"
{

    Caption = 'Designation';
    DelayedInsert = true;
    PageType = List;
    SourceTable = "Designation B2B";
    UsageCategory = Documents;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Designation code.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Designation name.';
                }
            }
        }
    }

    actions
    {
    }
}

