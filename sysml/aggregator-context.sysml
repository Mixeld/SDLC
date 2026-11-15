package AggregatorContext {
    doc /* Контекстная модель агрегатора оповещений: система и внешние участники */

    part def Aggregator;
    part def Observer;
    part def Administrator;
    part def ServiceSource;
    part def WeatherSource;
    part def NetworkAnomalySource;

    part aggregatorContext {
        part aggregator : Aggregator;
        part observer : Observer;
        part administrator : Administrator;
        part monitoredService : ServiceSource;
        part weatherService : WeatherSource;
        part networkSource : NetworkAnomalySource;

        connect observer to aggregator;
        connect administrator to aggregator;

        connect monitoredService to aggregator;
        connect weatherService to aggregator;
        connect networkSource to aggregator;
    }
    view contextView {
        expose aggregatorContext::**;
    }

    view contextTree {
        expose aggregatorContext::**;
        render asTreeDiagram;
    }

    view contextInterconnection {
        expose aggregatorContext::**;
        render asInterconnectionDiagram;
    }
}