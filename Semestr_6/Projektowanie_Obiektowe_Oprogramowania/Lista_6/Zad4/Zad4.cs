using System;
using System.Linq.Expressions;
using System.Linq;

class Program
{
    static void Main(string[] args)
    {
        Expression<Func<int, int>> f = n => 4 * (7 + n);
        PrintExpressionVisitor v = new PrintExpressionVisitor();
        v.Visit(f);

        ConstantExpression consExpr = Expression.Constant(10);
        v.Visit(consExpr);
        Expression conditionExpr = Expression.Condition(
                        Expression.MakeBinary(ExpressionType.GreaterThan,
                        Expression.Variable(typeof(int), "num"), Expression.Constant(10)),
                        Expression.Constant("num is greater than 10"),
                        Expression.Constant("num is smaller than 10")
                        );
        v.Visit(conditionExpr);

        v.Visit(Expression.Goto(Expression.Label("label")));
    }
}
public class PrintExpressionVisitor : ExpressionVisitor
{
    protected override Expression VisitBinary(BinaryExpression expression)
    {
        Console.WriteLine("{0} {1} {2}",
        expression.Left, expression.NodeType, expression.Right);
        return base.VisitBinary(expression);
    }
    protected override Expression VisitLambda<T>(Expression<T> expression)
    {
        Console.WriteLine("{0} -> {1}",
        expression.Parameters.Aggregate(string.Empty, (a, e) => a += e),
        expression.Body);
        return base.VisitLambda<T>(expression);
    }

    protected override Expression VisitConstant(ConstantExpression expression)
    {
        Console.WriteLine("{0}", expression.Value);
        return base.VisitConstant(expression);
    }

    protected override Expression VisitConditional(ConditionalExpression expression)
    {
        Console.WriteLine("if {0}", expression.Test);
        Console.WriteLine("    {0}\nelse\n   {1}", expression.IfTrue, expression.IfFalse);
        return expression;
    }

    protected override Expression VisitGoto(GotoExpression expression)
    {
        Console.WriteLine("goto {0}", expression.Target);
        return expression;
    }
}