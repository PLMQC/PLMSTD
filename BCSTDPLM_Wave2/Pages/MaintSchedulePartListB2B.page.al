page 33000907 "Maint. SchedulePart List B2B"
{

    Caption = 'Maintainance SchedulePart List';
    Editable = false;
    PageType = List;
    SourceTable = "Maintenance Schedule Part B2B";
    UsageCategory = Lists;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Defines machine no';
                }
                field("Machine ID"; Rec."Machine ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Machine ID.';
                }
                field("Component ID"; Rec."Component ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Components ID.';
                }
                field("Frequency ID"; Rec."Frequency ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Frequency ID.';
                }
                field("Maintenance Type"; Rec."Maintenance Type")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Maintenance Type.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Description.';
                }
                field("Maint. Sch. Template ID"; Rec."Maint. Sch. Template ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Maint. Sch. template ID.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Start Date.';
                }
                field("Next Due Date"; Rec."Next Due Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Next Due Date.';
                }
            }
        }
    }

    actions
    {
    }
}

