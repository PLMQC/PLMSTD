page 33000959 "Equipment Check Lists B2B"
{

    Caption = 'Equipment Check Lists';
    DelayedInsert = true;
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Equipment Check List B2B";
    SourceTableView = SORTING("Machine ID", Code);
    UsageCategory = Lists;
    ApplicationArea = all;
    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("Code"; Rec.Code)
                {
                    Editable = false;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Code.';
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Description.';
                }
                field("Before Maintenance"; Rec."Before Maintenance")
                {
                    Visible = false;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Before maintenance.';
                }
                field(Type; Rec.Type)
                {
                    OptionCaption = '" ,Specs,CheckList"';
                    Visible = false;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines type.';
                }
                field(Frequency; Rec.Frequency)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Frequency.';
                }
                field("Time Interval"; Rec."Time Interval")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Time Inteval.';
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
        area(navigation)
        {
            group(FunctionMenu1)
            {
                Caption = 'F&unctions';
                action(Confirm)
                {
                    Caption = 'Confirm';
                    Image = Confirm;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Confirm.';

                    trigger OnAction();
                    begin
                        Rec.ConfirmCheckList();
                    end;
                }
            }
        }
    }
}

