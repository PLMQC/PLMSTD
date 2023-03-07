page 33000919 "PM Job OP Particulars B2B"
{

    Caption = 'PM Job Operation Particulars';
    Editable = false;
    PageType = Worksheet;
    SourceTable = "PM Job OP Particulars B2B";
    ApplicationArea = All;
    UsageCategory = Tasks;
    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field(ID; Rec.ID)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the ID.';
                    Visible = false;
                }
                field("ScheduleTemplate ID"; Rec."ScheduleTemplate ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Schedule template ID.';
                    Visible = false;
                }
                field("Line Type"; Rec."Line Type")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Line type.';
                    Visible = false;
                }
                field("Line Type Name"; Rec."Line Type Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Line type Name.';
                }
                field("Sl. No."; Rec."Sl. No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Sl no.';
                    Visible = false;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the line No.';
                    Visible = false;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Amount.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the No Series.';
                    Visible = false;
                }
                field("I/R Code"; Rec."I/R Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the I/R Code.';
                    Caption = 'No';
                }
                field("I/R Description"; Rec."I/R Description")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the I/R description.';
                    Caption = 'Description';
                }
                field("Time Required"; Rec."Time Required")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Time required.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Quantity.';
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
                field("Job Card No."; Rec."Job Card No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Job card no.';
                    Visible = true;
                }
                field("Machine ID"; Rec."Machine ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Machine ID.';
                }
            }
        }
    }

    actions
    {
    }
}

