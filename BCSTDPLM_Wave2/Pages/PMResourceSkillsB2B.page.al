page 33000965 "PM Resource Skills B2B"
{

    Caption = 'Resource Skills';
    DataCaptionFields = "No.", "Skill Code";
    DelayedInsert = true;
    PageType = List;
    SourceTable = "PM Resource Skill B2B";
    UsageCategory = Documents;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Skill Code"; Rec."Skill Code")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines skill code.';
                }
                field("Machine No."; Rec."Machine No.")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Machine no.';
                }
            }
        }
    }

    actions
    {
    }
}

