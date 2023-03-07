page 33000895 "Maint. Sched. Line Proc B2B"
{

    AutoSplitKey = true;
    Caption = 'Maint. Sched. Line Procedures';
    DelayedInsert = true;
    PageType = Worksheet;
    SaveValues = true;
    SourceTable = "Maint. Sched. Line Proc B2B";
    UsageCategory = Tasks;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    Tooltip = 'This Field Shows the Maintenance schedule line description.';
                }
                field("Special Tools"; Rec."Special Tools")
                {
                    ApplicationArea = all;
                    Tooltip = 'This Field Specifies the Special Tools.';
                }
            }
        }
    }

    actions
    {
    }
}

