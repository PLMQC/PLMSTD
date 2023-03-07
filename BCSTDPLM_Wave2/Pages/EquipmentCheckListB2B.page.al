page 33000958 "Equipment Check List B2B"
{

    Caption = 'Equipment Check List';
    DelayedInsert = true;
    Editable = false;
    PageType = List;
    SourceTable = "Equipment Check List B2B";
    UsageCategory = Documents;
    ApplicationArea = all;
    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("Machine ID"; Rec."Machine ID")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Machine ID.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines code.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Description.';
                }
                field(Status; Rec.Status)
                {
                    OptionCaption = '" ,Ok,Not Ok"';
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

