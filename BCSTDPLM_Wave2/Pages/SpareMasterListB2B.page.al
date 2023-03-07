page 33000909 "Spare Master List B2B"
{

    Caption = 'Spare Master List';
    PageType = List;
    SourceTable = "Spare Master B2B";
    UsageCategory = Lists;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                field("Component ID"; Rec."Component ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'Defines Component ID.';
                }
                field("Component Name"; Rec."Component Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'Display Component name.';
                }
                field(Specification; Rec.Specification)
                {
                    ApplicationArea = all;
                    ToolTip = 'Defines Specification.';
                }
            }
        }
    }

    actions
    {
    }
}

