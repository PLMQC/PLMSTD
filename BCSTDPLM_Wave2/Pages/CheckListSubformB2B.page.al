page 33000961 "Check List Subform B2B"
{

    Caption = 'Check List Subform';
    DelayedInsert = true;
    PageType = ListPart;
    SourceTable = "Check List Line B2B";
    UsageCategory = Lists;
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
                    ToolTip = 'It Defines Code.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Description.';
                }
                field(Frequency; Rec.Frequency)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Frequency.';
                }
                field("Time Interval"; Rec."Time Interval")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Time Interval.';
                }
            }
        }
    }

    actions
    {
    }
}

