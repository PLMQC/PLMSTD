page 33000899 "Maint. Machine Schedule B2B"
{

    Caption = 'Maintenance Machine Schedule';
    DelayedInsert = true;
    PageType = Worksheet;
    SourceTable = "Maintenance Schedule Part B2B";
    UsageCategory = Tasks;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            field("Machine Name"; Rec."Machine Name")
            {
                Editable = false;
                ApplicationArea = all;
                ToolTip = 'This Field Defines Name of Equipment';
            }
            repeater(Control1102152000)
            {
                field("Component ID"; Rec."Component ID")
                {
                    Visible = false;
                    ApplicationArea = all;
                    ToolTip = 'Defines Unique no for Component';
                }
                field("Component Name"; Rec."Component Name")
                {
                    Visible = false;
                    ApplicationArea = all;
                    ToolTip = 'Defines Name for Component';
                }
                field("Frequency ID"; Rec."Frequency ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'Defines No for Frequency ';
                }
                field("Frequency Name"; Rec."Frequency Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'Defines Name for Frequency';
                }
                field("Maint. Sch. Template Name"; Rec."Maint. Sch. Template Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'Defines Name of Maintenance Schedule templete';
                }
                field("RunTime Hours"; Rec."RunTime Hours")
                {
                    Visible = false;
                    ApplicationArea = all;
                    ToolTip = 'Defines no of Run Time In Hours';
                }
                field("Line Late Reading"; Rec."Line Late Reading")
                {
                    ApplicationArea = all;
                    ToolTip = 'Defines line wise Late Readings';
                }
                field("Frequency Code"; Rec."Frequency Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'Defines Frequency like Hours or weekly or monthly';


                    trigger OnValidate();
                    begin

                        Equipment.RESET();
                        Equipment.SETRANGE("No.", Rec."Machine ID");
                        if Equipment.FINDFIRST() then
                            if Rec."Start Date" < Equipment."Date of Installed" then
                                ERROR(Text0003Lbl);
                    end;
                }
                field("Date Interval"; Rec."Date Interval")
                {
                    ApplicationArea = all;
                    ToolTip = 'Defines dates of Maintenance need to do';
                }
                field("Maintenance Type"; Rec."Maintenance Type")
                {
                    ApplicationArea = all;
                    ToolTip = 'Defines Type of Maintenance like internal or External';
                }
                field("Notice Days"; Rec."Notice Days")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = all;
                    ToolTip = 'Defines no of Notice Days';
                }
                field("Start Date"; Rec."Start Date")
                {

                    ApplicationArea = all;
                    ToolTip = 'Defines Starting Date of Maintenance ';
                    trigger OnValidate();
                    begin

                        Equipment.RESET();
                        Equipment.SETRANGE("No.", Rec."Machine ID");
                        if Equipment.FINDFIRST() then
                            if Rec."Start Date" < Equipment."Date of Installed" then
                                ERROR(Text0003Lbl);
                    end;
                }
                field("Next Due Date"; Rec."Next Due Date")
                {
                    Editable = false;
                    ApplicationArea = all;
                    ToolTip = 'Defines Due Date of Maintenance ';
                }
                field("Hrs Required"; Rec."Hrs Required")
                {
                    ApplicationArea = all;
                    ToolTip = 'Defines No of Hours Required for maintenance ';
                }
                field("Resource Cost"; Rec."Resource Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'Defines cost of resource for Maintenance ';
                }
                field("Planned Res.Person Cost"; Rec."Planned Res.Person Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'Defines cost of planned Resources';
                }
                field("Spares Cost"; Rec."Spares Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'Defines cost of Spares required for Maintenance';
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'Defines Total Cost of Maintenance ';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Line")
            {
                Caption = '&Line';
                action("Planned &Worksheet")
                {
                    Caption = 'Planned &Worksheet';
                    ApplicationArea = all;
                    ToolTip = 'It opens planned Worksheet for Maintenance ';
                    Image = PlanningWorksheet;
                    RunObject = Page "Maint. Schedule Subform B2B";
                    RunPageLink = "Schedule Template ID" = FIELD("No.");
                }
                action("Procedure")
                {
                    Caption = 'Procedure';
                    ApplicationArea = all;
                    ToolTip = 'It specifies the Procedure.';
                    Image = AddWatch;
                    RunObject = Page "Maint. Sched. Line Proc B2B";
                    RunPageLink = "Machine Sched. Part No." = FIELD("No."),
                                  "Machine ID" = FIELD("Machine ID");
                }
                action(Attachments)
                {
                    Caption = 'Attachments';
                    ApplicationArea = all;
                    ToolTip = 'With this option, an attachment containing further details of the machine ';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                    begin
                        CLEAR(AttachmentsDocumentPageGVar);
                        AttachmentGRec.RESET();
                        AttachmentGRec.FILTERGROUP(2);
                        AttachmentGRec.SETRANGE("Filter Key 1", FORMAT(Rec."Machine ID"));
                        AttachmentGRec.FILTERGROUP(0);
                        AttachmentsDocumentPageGVar.SETTABLEVIEW(AttachmentGRec);
                        AttachmentsDocumentPageGVar.CAPTION(CurrPage.CAPTION());
                        AttachmentsDocumentPageGVar.SetValues(FORMAT(Rec."Machine ID"), '', FORMAT(Rec."Machine ID"), DATABASE::"Maintenance Schedule Part B2B");
                        AttachmentsDocumentPageGVar.RUNMODAL();
                    end;
                }
            }
        }
    }

    trigger OnDeleteRecord(): Boolean;
    begin
        if Rec."Job Card Created" then
            ERROR(Text0002Lbl);
    end;

    var
        Equipment: Record "Equipment B2B";
        AttachmentGRec: Record "Attachment Documents B2B";
        AttachmentsDocumentPageGVar: Page "Attachments Document B2B";
        Text0002Lbl: Label 'Line can not be deleted. Jobcard exists.';
        Text0003Lbl: Label 'Start Date must not be greater than Equipment Date of Installed';
}

