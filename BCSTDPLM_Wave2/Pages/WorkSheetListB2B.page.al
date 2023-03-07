page 33000917 "Work Sheet List B2B"
{

    Caption = 'Work Sheet List';
    Editable = false;
    PageType = List;
    SourceTable = "Work Sheet B2B";
    UsageCategory = Lists;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("Job Card No."; Rec."Job Card No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Job Card No.';
                }
                field("Machine ID"; Rec."Machine ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Machine ID.';
                }
                field("Line Type"; Rec."Line Type")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Line Type.';
                }
                field("I/R Code"; Rec."I/R Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the I/R Code.';
                }
                field("I/R Description"; Rec."I/R Description")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the I/R description.';
                }
                field("Time Required"; Rec."Time Required")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Time Required .';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Qunatity.';
                }
                field(UOM; Rec.UOM)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the UOM.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Unit cost.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the amount.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Location.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Remarks.';
                }
            }
        }
    }

    actions
    {
    }
}

