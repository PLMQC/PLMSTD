page 33000941 "Frequency B2B"
{

    Caption = 'Frequency';
    PageType = List;
    SourceTable = "Frequency  B2B";
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
                    ToolTip = 'It Defines Frequency Code.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Description.';
                }
                field("Run Time"; Rec."Run Time")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Run time.';
                }
                field("Time Interval"; Rec."Time Interval")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines time Interval.';
                }
                field("Frequency Type"; Rec."Frequency Type")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Frequency type.';
                }
            }
        }
    }

    actions
    {
    }
}

