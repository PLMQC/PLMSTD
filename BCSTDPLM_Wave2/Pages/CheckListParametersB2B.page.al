page 33000956 "Check List Parameters B2B"
{

    Caption = 'Check List Parameters';
    DelayedInsert = true;
    PageType = List;
    SourceTable = "Check List Parameters B2B";
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
                    ToolTip = 'It Defines Code.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Description.';
                }
                field(Interval; Rec.Interval)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Interval.';
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

