
module sqld.ast.visitor;

import sqld.ast;

interface Visitor
{
    void visit(immutable(ArithmeticNode) node);

    void visit(immutable(AssignmentNode) node);

    void visit(immutable(AsNode) node);

    void visit(immutable(BetweenNode) node);

    void visit(immutable(ColumnNode) node);

    void visit(immutable(DeleteNode) node);

    void visit(immutable(DirectionNode) node);

    void visit(immutable(ExpressionListNode) node);

    void visit(immutable(FromNode) node);

    void visit(immutable(FunctionNode) node);

    void visit(immutable(GroupByNode) node);

    void visit(immutable(HavingNode) node);

    void visit(immutable(InsertNode) node);

    void visit(immutable(IntoNode) node);

    void visit(immutable(InvocationNode) node);

    void visit(immutable(JoinNode) node);

    void visit(immutable(LimitNode) node);

    void visit(immutable(LiteralNode) node);

    void visit(immutable(LogicalNode) node);

    void visit(immutable(NamedWindowNode) node);

    void visit(immutable(OffsetNode) node);

    void visit(immutable(OrderByNode) node);

    void visit(immutable(OverNode) node);

    void visit(immutable(ParameterNode) node);

    void visit(immutable(PartitionByNode) node);

    void visit(immutable(PostfixNode) node);

    void visit(immutable(PrefixNode) node);

    void visit(immutable(ProjectionNode) node);

    void visit(immutable(RelationalNode) node);

    void visit(immutable(ReturningNode) node);

    void visit(immutable(SelectNode) node);

    void visit(immutable(SetNode) node);

    void visit(immutable(SubqueryNode) node);

    void visit(immutable(SQLNode) node);

    void visit(immutable(TableNode) node);

    void visit(immutable(UnionNode) node);

    void visit(immutable(UpdateNode) node);

    void visit(immutable(UsingNode) node);

    void visit(immutable(ValuesNode) node);

    void visit(immutable(WhereNode) node);

    void visit(immutable(WindowDefinitionNode) node);

    void visit(immutable(WindowNode) node);

    void visit(immutable(WithNode) node);
}

mixin template Visitable()
{
    override void accept(Visitor visitor) immutable
    {
        visitor.visit(this);
    }
}
